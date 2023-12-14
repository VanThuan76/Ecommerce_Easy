import { useAppSelector } from "@/shared/hooks/useRedux";
import { cartService } from "@/shared/services/cart.service";
import { Button, Image, InputNumber, message } from "antd";
import { useMutation, useQuery } from "react-query";
import { Table } from "antd";
import type { ColumnsType } from "antd/es/table";
import WebsiteLayout from "@/shared/layout/WebsiteLayout";
import { ICart, IStoreCart } from "@/shared/typeDef/cart.type";
import { formatCurrency } from "@/shared/utils/formatCurrency";
import { DeleteOutlined } from "@ant-design/icons";
import { useDispatch } from "react-redux";
import { addCart, storeCart, totalPayment } from "@/shared/store/appSlice";
import { useNavigate } from "react-router-dom";

const StoreCart = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const { user, quantityCart } = useAppSelector((state) => state.appSlice);
  if (!user) return <></>;
  const { data: cartStore, refetch } = useQuery(["listCartStore"], () =>
    cartService.listByUser(user.id)
  );
  const updateCartMutation = useMutation({
    mutationKey: "updateCart",
    mutationFn: (body: ICart) => cartService.update(body),
    onSuccess(data, _variables, _context) {
      if (data) {
        refetch();
        dispatch(storeCart(cartStore?.data.data!));
      }
      message.success("Cập nhật thành công");
    },
    onError(error, variables, context) {
      message.error("Cập nhật không thành công");
    },
  });
  const removeCartMutation = useMutation({
    mutationKey: "removeCart",
    mutationFn: (id: number) => cartService.delete(id),
    onSuccess(data, _variables, _context) {
      if (data) {
        refetch();
        dispatch(storeCart(cartStore?.data.data!));
      }
      message.success("Cập nhật thành công");
    },
    onError(error, variables, context) {
      message.error("Cập nhật không thành công");
    },
  });
  if (!cartStore) return <></>;
  const handleChange = (value: number, cartInfor: ICart, id: number) => {
    const bodyUpdate = {
      id: id,
      ...cartInfor,
    };
    updateCartMutation.mutate(bodyUpdate);
  };
  const handleRemove = (id: number, quantity: number) => {
    removeCartMutation.mutate(id);
    dispatch(addCart(Number(quantityCart) - quantity));
  };
  const columns: ColumnsType<IStoreCart> = [
    {
      title: "Hình ảnh",
      dataIndex: "image",
      key: "image",
      render: (_, record) => (
        <Image width={200} src={record.product_infor.image} />
      ),
    },
    {
      title: "Tên",
      dataIndex: "title",
      key: "title",
      render: (_, record) => <p>{record.product_infor.title}</p>,
    },
    {
      title: "Giá",
      dataIndex: "price",
      key: "price",
      render: (_, record) => {
        return record && record?.product_infor?.promotion?.discount ? (
          <p>
            {formatCurrency(
              record.product_infor.price -
                (record.product_infor.price / 100) *
                  record.product_infor.promotion.discount
            )}
          </p>
        ) : (
          <p>{formatCurrency(record.product_infor.price)}</p>
        );
      },
    },
    {
      title: "Số lượng",
      key: "quantity",
      dataIndex: "quantity",
      render: (_, record) => (
        <InputNumber
          min={1}
          defaultValue={record.quantity}
          onChange={(value) => {
            const cartInfor: ICart = {
              user_id: Number(user?.id),
              product_id: Number(record?.product_id),
              quantity: Number(value),
              price: record?.product_infor.promotion
                ? Number(
                    record?.product_infor.price -
                      (record?.product_infor.price / 100) *
                        record.product_infor.promotion.discount
                  )
                : Number(record?.product_infor.price),
            };
            handleChange(value as number, cartInfor, record.id);
          }}
        />
      ),
    },
    {
      title: "Thành tiền",
      key: "price",
      dataIndex: "price",
      render: (_, record) => <p>{formatCurrency(record.price)}</p>,
    },
    {
      title: "Xoá",
      key: "id",
      dataIndex: "id",
      render: (_, record) => (
        <DeleteOutlined
          onClick={() => handleRemove(record.id, record.quantity)}
        ></DeleteOutlined>
      ),
    },
  ];
  const totalPrice =
    cartStore.data &&
    cartStore?.data.data &&
    cartStore.data.data.reduce((total, currentItem) => {
      return total + currentItem.price;
    }, 0);
  return (
    <WebsiteLayout>
      <div className="w-full flex flex-col justify-start items-start gap-10">
        <h1 className="text-5xl">Giỏ hàng</h1>
        <Table
          className="w-full"
          columns={columns}
          dataSource={
            cartStore.data && cartStore?.data.data && cartStore.data.data
          }
        />
        <p>Thành tiền: {formatCurrency(totalPrice)}</p>
        {cartStore.data.data.length > 0 && (
          <Button
            onClick={() => {
              dispatch(totalPayment(totalPrice));
              navigate("/payment");
            }}
          >
            Thanh toán
          </Button>
        )}
      </div>
    </WebsiteLayout>
  );
};

export default StoreCart;

import WebsiteLayout from "@/shared/layout/WebsiteLayout";
import { productService } from "@/shared/services/product.service";
import { formatCurrency } from "@/shared/utils/formatCurrency";
import { ShoppingCartOutlined, UserOutlined } from "@ant-design/icons";
import { Avatar, Button, Image, InputNumber, message, Rate, Tabs } from "antd";
import { useMutation, useQuery } from "react-query";
import { useNavigate, useParams } from "react-router-dom";
import type { TabsProps } from "antd";
import { useState } from "react";
import { useAppSelector } from "@/shared/hooks/useRedux";
import { ICart } from "@/shared/typeDef/cart.type";
import { useDispatch } from "react-redux";
import { addCart, storeCart } from "@/shared/store/appSlice";
import { cartService } from "@/shared/services/cart.service";

const DetailOrderMenu = () => {
  const navigate = useNavigate()
  const dispatch = useDispatch();
  const { user, quantityCart } = useAppSelector((state) => state.appSlice);
  const [quantity, setQuantity] = useState(NaN);
  const { id } = useParams();
  const { data } = useQuery(
    ["detailProduct", id],
    () => productService.getDetail(Number(id) as number),
    {
      select(data) {
        return data.data.data;
      },
      enabled: !!id,
    }
  );
  const handleQuantity = (value: number) => {
    setQuantity(value);
  };

  const items: TabsProps["items"] = [
    {
      key: "1",
      label: "Mô tả",
      children: <p>{data?.description}</p>,
    },
    {
      key: "2",
      label: "Đánh giá",
      children: <Avatar size="small" icon={<UserOutlined />} />,
    },
  ];
  const onChange = (key: string) => {
    console.log(key);
  };
  const newCartMutation = useMutation({
    mutationKey: "newCart",
    mutationFn: (body: ICart) => cartService.new(body),
    onSuccess(data, _variables, _context) {
      message.success("Thêm thành công");
    },
    onError(error, variables, context) {
      message.error("Thêm không thành công");
    },
  });
  const handleCart = (cartInfor: ICart) => {
    if(!user){
      navigate("/login")
    }else{
      const cartArray = [];
      if (cartInfor) {
        cartArray.push(cartInfor);
        dispatch(addCart(Number(quantityCart) + cartInfor.quantity));
        dispatch(storeCart(cartArray));
        newCartMutation.mutate(cartInfor)
      }
    }
  };
  return (
    <WebsiteLayout>
      <div className="w-full h-full flex flex-col justify-start items-start gap-10">
        <div className="w-full flex justify-around items-start gap-10">
          <Image
            className="rounded-lg"
            width={400}
            src={data?.image}
          />
          <div className="w-full h-full flex flex-col justify-start items-start gap-3">
            <h2 className="font-bold text-2xl">{data?.title}</h2>
            <Rate />
            <p className="text-xl">
              {data?.promotion
                ? `${formatCurrency(
                    data?.price - (data?.price / 100) * data?.promotion.discount
                  )} - Giá gốc: ${formatCurrency(data?.price)}`
                : formatCurrency(Number(data?.price))}
            </p>
            <div className="flex justify-start items-start gap-3">
              <InputNumber
                min={1}
                defaultValue={1}
                onChange={(value) => handleQuantity(Number(value))}
                addonBefore="Số lượng"
              />
              <Button
                className="flex justify-center items-center"
                icon={<ShoppingCartOutlined />}
                onClick={() => {
                  const cartInfor: ICart = {
                    user_id: Number(user?.id),
                    product_id: Number(data?.id),
                    quantity: quantity ? quantity : 1,
                    price: data?.promotion ? Number(data?.price - (data?.price / 100 * data.promotion.discount)) : Number(data?.price),
                  };
                  handleCart(cartInfor);
                }}
              >
                Thêm
              </Button>
            </div>
          </div>
        </div>
        <div className="w-full">
          <Tabs defaultActiveKey="1" items={items} onChange={onChange} />
        </div>
      </div>
    </WebsiteLayout>
  );
};

export default DetailOrderMenu;

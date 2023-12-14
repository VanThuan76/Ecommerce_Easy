import { useAppSelector } from "@/shared/hooks/useRedux";
import WebsiteLayout from "@/shared/layout/WebsiteLayout";
import { paymentService } from "@/shared/services/payment.service";
import { Button, Checkbox, Form, Input, message, Select } from "antd";
import { useMutation } from "react-query";
type FieldType = {
  address?: string;
  note?: string;
  type?: number;
};
const Payment = () => {
  const { user, cart, totalPayment } = useAppSelector(
    (state) => state.appSlice
  );
  const redirectVnPay = useMutation({
    mutationKey: "vnPay",
    mutationFn: (body: { orderId: string; total: number }) =>
      paymentService.paymentVnpay(body),
    onSuccess(data, _variables, _context) {
      window.open(data.data.data);
    },
    onError(error, variables, context) {},
  });
  const newPaymentMutation = useMutation({
    mutationKey: "newPayment",
    mutationFn: (body: {
      userId: number;
      address: string;
      note?: string;
      type: number;
      total: number;
    }) => paymentService.new(body),
    onSuccess(data, _variables, _context) {
      const result = data.data.data;
      if (result.type === 1) {
        const body = {
          userId: user?.id,
          orderId: `VNPAY${result.id}`,
          total: totalPayment,
        };
        redirectVnPay.mutate(body);
      }

      message.success("Cập nhật thành công");
    },
    onError(error, variables, context) {
      message.error("Cập nhật không thành công");
    },
  });
  const onFinish = (values: any) => {
    const totalCartPrice = cart.reduce((total, item) => {
      return total + item.price * item.quantity;
    }, 0);
    const body = {
      userId: user?.id!,
      address: values.address,
      note: values.note,
      type: values.type,
      total: totalCartPrice,
    };
    newPaymentMutation.mutate(body);
  };

  const onFinishFailed = (errorInfo: any) => {
    console.log("Failed:", errorInfo);
  };

  return (
    <WebsiteLayout>
      <div className="w-full flex flex-col justify-center items-center gap-10">
        <h1 className="text-5xl">Thông tin thanh toán</h1>
        <Form
          className="w-full"
          name="basic"
          initialValues={{ remember: true }}
          onFinish={onFinish}
          onFinishFailed={onFinishFailed}
          autoComplete="off"
        >
          <Form.Item<FieldType>
            label="Địa chỉ"
            name="address"
            rules={[{ required: true, message: "Vui lòng nhập địa chỉ" }]}
          >
            <Input />
          </Form.Item>
          <Form.Item<FieldType>
            label="Hình thức thanh toán"
            name="type"
            rules={[{ required: true, message: "Vui lòng nhập địa chỉ" }]}
          >
            <Select>
              <Select.Option value={1}>Chuyển khoản</Select.Option>
              <Select.Option value={2}>Thanh toán khi nhận hàng</Select.Option>
            </Select>
          </Form.Item>
          <Form.Item<FieldType> label="Lưu ý" name="note">
            <Input.TextArea />
          </Form.Item>
          <Form.Item wrapperCol={{ offset: 11, span: 16 }}>
            <Button htmlType="submit">Tiếp tục</Button>
          </Form.Item>
        </Form>
      </div>
    </WebsiteLayout>
  );
};

export default Payment;

import { authService } from "@/shared/services/auth.service";
import { Button, Card, Form, Input, message, Row, Typography, Col } from "antd";
import { setCookie } from "cookies-next";
import { useMutation } from "react-query";
import BlankLayout from "@/shared/layout/BlankLayout";
import { useDispatch } from "react-redux";
import { login } from "@/shared/store/appSlice";
import { APP_SAVE_KEYS } from "@/shared/constant/AppConstant";
import GoogleIcon from "@/shared/components/icons/googleIcon";
import { useNavigate } from "react-router-dom";
import FacebookIcon from "@/shared/components/icons/facebookIcon";
import TwitterIcon from "@/shared/components/icons/twitterIcon";
type Props = {};

const Register = ({}: Props) => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const registerMutation = useMutation({
    mutationKey: "register",
    mutationFn: (body: {
      name: string;
      email: string;
      password: string;
      password_confirmation: string;
    }) => authService.register(body),
    onSuccess(data, _variables, _context) {
      const res = data.data.data;
      setCookie(APP_SAVE_KEYS.KEYS, true, { maxAge: 1000 });
      setCookie(APP_SAVE_KEYS.USER_ID, res.id, { maxAge: 1000 });
      dispatch(login(res));
      message.success("Đăng nhập thành công");
      navigate("/");
    },
    onError(error, variables, context) {
      message.error("Đăng nhập không thành công");
    },
  });
  //Handle submit form Register
  function handleLogin(value: {
    name: string;
    email: string;
    password: string;
    password_confirmation: string;
  }) {
    registerMutation.mutate(value);
  }
  return (
    <BlankLayout>
      <div className="w-full h-screen mx-auto flex justify-center items-center">
        <Card
          title="Trang đăng ký"
          style={{ minWidth: 400 }}
          extra={
            <img
              style={{ maxWidth: 50, maxHeight: 50 }}
              alt="logo"
              src="/profile.png"
            />
          }
        >
          <Form
            name="basic"
            initialValues={{ remember: true }}
            onFinish={handleLogin}
            autoComplete="off"
            layout="vertical"
          >
            <Form.Item
              label="Tài khoản"
              name="name"
              rules={[{ required: true, message: "Vui lòng nhập tài khoản" }]}
            >
              <Input />
            </Form.Item>

            <Form.Item
              label="Email"
              name="email"
              rules={[{ required: true, message: "Vui lòng nhập tài khoản" }]}
            >
              <Input />
            </Form.Item>

            <Form.Item
              label="Mật khẩu"
              name="password"
              rules={[{ required: true, message: "Vui lòng nhập mật khẩu" }]}
            >
              <Input.Password />
            </Form.Item>

            <Form.Item
              label="Xác nhận mật khẩu"
              name="password_confirmation"
              rules={[{ required: true, message: "Vui lòng nhập mật khẩu" }]}
            >
              <Input.Password />
            </Form.Item>
            <Typography.Link
              className="flex justify-end items-end mb-5"
              href="/login"
            >
              Quay trở về đăng nhập
            </Typography.Link>
            <Row
              gutter={16}
              className="mb-5"
              justify={"center"}
              align={"middle"}
            >
              <Col>
                <FacebookIcon className="text-2xl" />
              </Col>
              <Col>
                <GoogleIcon className="text-2xl" />
              </Col>
              <Col>
                <TwitterIcon className="text-2xl" />
              </Col>
            </Row>
            <Form.Item style={{ textAlign: "center" }}>
              <Button htmlType="submit" loading={registerMutation.isLoading}>
                Đăng ký
              </Button>
            </Form.Item>
          </Form>
        </Card>
      </div>
    </BlankLayout>
  );
};
export default Register;

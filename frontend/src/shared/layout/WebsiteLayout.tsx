import { BellOutlined, ShoppingCartOutlined } from "@ant-design/icons";
import { Badge, Button, Dropdown, Layout, Menu, MenuProps, Space } from "antd";
import Search from "antd/es/input/Search";
import { deleteCookie, getCookie } from "cookies-next";
import React, { useState } from "react";
import { useQuery } from "react-query";
import { useDispatch } from "react-redux";
import { useNavigate } from "react-router-dom";
import { APP_SAVE_KEYS, APP_WEBSITE_MENU } from "../constant/AppConstant";
import { useAppSelector } from "../hooks/useRedux";
import { userService } from "../services/user.service";
import { login } from "../store/appSlice";
const { Header, Content, Footer } = Layout;

type Props = {
  children: React.ReactNode;
};
const WebsiteLayout = ({ children }: Props) => {
  const dispatch = useDispatch();
  const { user, quantityCart } = useAppSelector((state) => state.appSlice);
  const userId = getCookie(APP_SAVE_KEYS.USER_ID);
  const [current, setCurrent] = useState("");
  const navigate = useNavigate();
  const onClick: MenuProps["onClick"] = (e) => {
    setCurrent(e.key);
    navigate(`${e.key}`);
  };
  useQuery(
    ["detailUser", userId],
    () => userService.getDetail(Number(userId) as number),
    {
      onSuccess(data) {
        dispatch(login(data.data.data));
      },
      enabled: !!userId,
    }
  );
  const items: MenuProps["items"] = [
    {
      key: "1",
      label: (
        <Button onClick={() => {
          deleteCookie(APP_SAVE_KEYS.KEYS);
          deleteCookie(APP_SAVE_KEYS.USER_ID);
          navigate("/login")
        }}>Đăng xuất</Button>
      ),
    },
  ];
  const handleSearch = (e:any) => {
    navigate(`/order-menu?=${e}`)
  }
  return (
    <React.Fragment>
      <Header className="flex justify-between items-center bg-[#fff]">
        <div
          className="text-2xl px-4 cursor-pointer"
          onClick={() => navigate("/")}
        >
          Logo
        </div>
        <div className="w-full grid grid-cols-5 justify-start items-center gap-2">
          <Menu
            className="col-span-2 border-none"
            theme="light"
            onClick={(e) => {
              window.location.href = `http://localhost:3000/${e.key}`
            }}
            selectedKeys={[current]}
            mode="horizontal"
            items={APP_WEBSITE_MENU}
          />
          <Search
            className="col-span-2 bg-blue-300 rounded-lg"
            placeholder="Tìm kiếm"
            onSearch={(e) => handleSearch(e)}
            enterButton
          />
          <div className="flex justify-end items-center gap-4">
            <BellOutlined className="text-xl" />
            <Badge count={quantityCart} showZero>
              <ShoppingCartOutlined
                className="text-xl"
                onClick={() => navigate("/cart")}
              />
            </Badge>
            {user ? (
              <Dropdown menu={{ items }}>
                <a onClick={(e) => e.preventDefault()}>
                  <Space>
                    <p>Xin chào {user.name}</p>
                  </Space>
                </a>
              </Dropdown>
            ) : (
              <Button onClick={() => navigate("/login")}>Đăng nhập</Button>
            )}
          </div>
        </div>
      </Header>
      <Content className="w-full min-h-[100vh] flex justify-center items-start mx-auto p-20">
        {children}
      </Content>
      <Footer style={{ textAlign: "center" }}>
        Ant Design ©2023 Created by Ant UED
      </Footer>
    </React.Fragment>
  );
};

export default WebsiteLayout;

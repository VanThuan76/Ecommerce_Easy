import { BellOutlined, ShoppingCartOutlined } from "@ant-design/icons";
import { Button, Layout, Menu, MenuProps } from "antd";
import Search from "antd/es/input/Search";
import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { APP_WEBSITE_MENU } from "../constant/AppConstant";
const { Header, Content, Footer } = Layout;

type Props = {
  children: React.ReactNode;
};
const WebsiteLayout = ({ children }: Props) => {
  const [current, setCurrent] = useState("");
  const navigate = useNavigate()
  const onClick: MenuProps["onClick"] = (e) => {
    setCurrent(e.key);
    navigate(e.key)
  };
  return (
    <React.Fragment>
      <Header className="flex justify-between items-center bg-[#fff]">
        <div className="text-2xl px-4">Logo</div>
        <div className="w-full grid grid-cols-5 justify-start items-center gap-2">
          <Menu
            className="col-span-2 border-none"
            theme="light"
            onClick={onClick}
            selectedKeys={[current]}
            mode="horizontal"
            items={APP_WEBSITE_MENU}
          />
          <Search
            className="col-span-2 bg-blue-300 rounded-lg"
            placeholder="Tìm kiếm"
            onSearch={() => {}}
            enterButton
          />
          <div className="flex justify-end items-center gap-4">
            <BellOutlined />
            <ShoppingCartOutlined />
            <Button>Login</Button>
          </div>
        </div>
      </Header>
      <Content className="w-full h-[100vh] flex justify-center items-center mx-auto p-20">{children}</Content>
      <Footer style={{ textAlign: "center" }}>
        Ant Design ©2023 Created by Ant UED
      </Footer>
    </React.Fragment>
  );
};

export default WebsiteLayout;

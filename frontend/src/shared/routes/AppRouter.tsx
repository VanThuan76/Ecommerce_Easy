import Login from "../../pages/login";
import { Helmet } from "react-helmet";
import { Routes, Route } from "react-router-dom";
import { ProtectedRoute } from "./ProtectRoute.jsx";
import Home from "@/pages/home";
import OrderMenu from "@/pages/orderMenu";
import DetailOrderMenu from "@/pages/orderMenu/detail";
import Register from "@/pages/register";
import StoreCart from "@/pages/cart";
import Payment from "@/pages/payment";

export const AppRouter = () => {
  return (
    <>
      <Helmet>
        <title>Cửa hàng bách khoa</title>
        <meta name="description" content="Cửa hàng bách khoa" />
        <link rel="icon" type="image/x-icon" href={"logo"} />
      </Helmet>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/order-menu" element={<OrderMenu />} />
        <Route path="/order-menu/:id" element={<DetailOrderMenu />} />
        <Route
          path="/cart"
          element={
            <ProtectedRoute>
              <StoreCart />
            </ProtectedRoute>
          }
        />
        <Route
          path="/payment"
          element={
            <ProtectedRoute>
              <Payment />
            </ProtectedRoute>
          }
        />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        {/* <Route
          path="/dashboard/account"
          element={
            <ProtectedRouteDashboardAdmin>
              <AccountManagement />
            </ProtectedRouteDashboardAdmin>
          }
        /> */}
      </Routes>
    </>
  );
};

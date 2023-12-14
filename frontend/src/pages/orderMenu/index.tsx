import WebsiteLayout from "@/shared/layout/WebsiteLayout";
import { productService } from "@/shared/services/product.service";
import { productGroupService } from "@/shared/services/productGroup.service";
import { IProduct } from "@/shared/typeDef/product.type";
import { formatCurrency } from "@/shared/utils/formatCurrency";
import { Card } from "antd";
import { useEffect, useState } from "react";
import { useQuery } from "react-query";
import { useLocation, useNavigate } from "react-router-dom";
const { Meta } = Card;

const OrderMenu = () => {
  const location = useLocation();
  const queryString = location.search.substring(1);
  const navigate = useNavigate();
  const [group, setGroup] = useState(NaN);
  const [filterData, setFilterData] = useState<IProduct[] | undefined>(
    undefined
  );
  const { data: dataProductGroup } = useQuery(["listProductGroup"], () =>
    productGroupService.getAll()
  );
  const { data: dataProduct } = useQuery(["listProduct"], () =>
    productService.getAll()
  );

  const { data: dataProductSearch } = useQuery(["listProductSearch"], () =>
    productService.search(queryString.split("=")[1])
  );

  useQuery(
    ["listProductByGroup", group],
    () => productService.getByProductGroup(group as number),
    {
      onSuccess(data) {
        setFilterData(data.data.data);
      },
      enabled: !isNaN(group),
    }
  );

  useEffect(() => {
    if (queryString.includes("=")) {
      if (dataProductSearch?.data.data) {
        setFilterData(dataProductSearch.data.data);
      }
    } else {
      if (dataProduct?.data.data) {
        setFilterData(dataProduct.data.data);
      }
    }
  }, [dataProduct]);
  return (
    <WebsiteLayout>
      <div className="w-full h-full grid grid-cols-5 justify-start items-start">
        <div className="col-span-1">
          <div className="flex flex-col justify-start items-start gap-3">
            <h3 className="text-2xl font-bold border-b-2 border-bg[#000]">
              Danh mục
            </h3>
            {dataProductGroup &&
              dataProductGroup.data &&
              dataProductGroup.data.data.map((item) => {
                return (
                  <p
                    key={item.id}
                    onClick={() => setGroup(item.id)}
                    className={`cursor-pointer ${
                      group === item.id && "text-cyan-700"
                    }`}
                  >
                    {item.title}
                  </p>
                );
              })}
          </div>
        </div>
        <div className="col-span-4 flex justify-start items-start gap-5">
          {filterData &&
            filterData.map((item) => {
              return (
                <Card
                  onClick={() => navigate(`/order-menu/${item.id}`)}
                  key={item.id}
                  hoverable
                  className="w-[240px] h-[300px]"
                  cover={
                    <img
                      className="h-[200px]"
                      alt={item.title}
                      src={item.image}
                    />
                  }
                >
                  <Meta
                    title={item.title}
                    description={
                      item.promotion
                        ? `${formatCurrency(
                            item.price -
                              (item.price / 100) * item.promotion.discount
                          )} - Giá gốc: ${formatCurrency(item.price)}`
                        : formatCurrency(item.price)
                    }
                  />
                </Card>
              );
            })}
        </div>
      </div>
    </WebsiteLayout>
  );
};

export default OrderMenu;

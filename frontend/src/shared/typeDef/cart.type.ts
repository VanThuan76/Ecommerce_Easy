import { IProduct } from "./product.type";

export interface ICart {
  id?: number
  user_id: number,
  product_id: number,
  quantity: number,
  price: number
}

export interface IStoreCart {
  id: number;
  user_id: number;
  product_id: number;
  quantity: number;
  price: number;
  created_at: string;
  updated_at: string;
  product_infor: IProduct;
}
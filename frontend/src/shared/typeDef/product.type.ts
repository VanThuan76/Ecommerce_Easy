import { IProductGroup } from "./productGroup.type";
import { IPromotion } from "./promotion.type";

export interface IProduct {
  id: number;
  product_group_id: number;
  title: string;
  description: string;
  image: string;
  price: number;
  quantity: number;
  created_at: string;
  updated_at: string;
  product_group: IProductGroup;
  promotion?: IPromotion;
}
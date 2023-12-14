export interface IUser {
  id: number;
  name: string;
  email: string;
  email_verified_at?: any;
  gender: number;
  birthday?: any;
  address?: any;
  avatar?: any;
  created_at: string;
  updated_at: string;
}
export interface IAccount {
  name: string;
  email: string;
  updated_at?: string;
  created_at?: string;
  token?: string;
  id: number;
  cartExits?: number;
}
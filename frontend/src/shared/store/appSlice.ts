import type { PayloadAction } from '@reduxjs/toolkit';
import { createSlice } from '@reduxjs/toolkit';
import { ICart } from '../typeDef/cart.type';
import { IAccount } from '../typeDef/user.type';

type APPSTATE = {
    user: IAccount | undefined,
    isAuth: boolean,
    cart: ICart[],
    quantityCart: number,
    totalPayment: number
}

const initialState: APPSTATE = {
    user: undefined,
    isAuth: false,
    cart: [],
    quantityCart: 0,
    totalPayment: 0
}
export const appSlice = createSlice({
    name: 'appSlice',
    initialState,
    reducers: {
        login: (state, action: PayloadAction<IAccount>) => {
            state.user = action.payload
            state.quantityCart = action.payload.cartExits as number
            state.isAuth = true
        },
        logout: (state) => {
            state.user = undefined
            state.isAuth = false
        },
        storeCart: (state, action: PayloadAction<ICart[]>) => {
            state.cart = action.payload
        },
        addCart: (state, action: PayloadAction<number>) => {
            state.quantityCart = action.payload
        },
        totalPayment: (state, action: PayloadAction<number>) => {
            state.totalPayment = action.payload
        }
    }
}
)
// Action creators are generated for each case reducer function
export const { login, logout, storeCart, addCart, totalPayment } = appSlice.actions
export default appSlice.reducer

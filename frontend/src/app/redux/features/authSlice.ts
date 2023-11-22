'use client'

import { createSlice } from "@reduxjs/toolkit"

export interface AuthState {
    user: User | null
}

export interface User {
    id: string,
    email : string
    token: string
}

const initialState: AuthState = {
    user: null
}

export const authSlice = createSlice({
    name: 'auth',
    initialState,
    reducers: {
        setUser: (state, action) => {state.user = action.payload},
        logout: (state, action) => {state.user = null}
    }
})

export const {setUser, logout} = authSlice.actions
export default authSlice.reducer

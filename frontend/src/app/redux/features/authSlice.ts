'use client'

import { createSlice } from "@reduxjs/toolkit"

export interface AuthState {
    user: User | null
}

export interface User {
    username: string | null,
    photo: string | null,
    id: string,
    email : string
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

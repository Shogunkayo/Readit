'use client'

// export const user = typeof window !== "undefined" ? window.localStorage.getItem('user') : null

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
    user: null // user ? JSON.parse(user) : null
}

export const authSlice = createSlice({
    name: 'auth',
    initialState,
    reducers: {
        setUser: (state, action) => {state.user = action.payload},
        logout: (state) => {
            state.user = null
            localStorage.removeItem('user')
        }
    }
})

export const {setUser, logout} = authSlice.actions
export default authSlice.reducer

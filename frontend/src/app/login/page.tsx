'use client'

import Link from "next/link";
import { useEffect, useState } from "react";
import MouseBlob from "../components/MouseBlob";

type Props = {}

const Login = (props: Props) => {
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')

    const handleLogin = () => {
        console.log('Email:', email)
        console.log('Password:', password)

        setEmail('')
        setPassword('')
    }
    
    return (
        <div>
            <MouseBlob></MouseBlob>
            <div className="div-component bg-text min-h-screen flex items-center justify-center"> 
                <div className="transition-opacity p-8 rounded-3xl shadow-2xl w-[28rem] z-10 translate-y-[-5rem]">
                    <h1 className="text-3xl font-bold text-primary mb-4 font-heading">Welcome to <span className="text-gradient">Readit</span></h1>
                    <p className="text-secondary mb-4">Please log in to access your account.</p>
                    <form>
                        <label className="block mb-2 text-secondary"> Email:
                        <input
                            type="email"
                            value={email}
                            required
                            onChange={(e) => setEmail(e.target.value)}
                            className="w-full p-2 border rounded mt-1"
                        />
                        </label>
                        <label className="block mb-2 text-secondary"> Password:
                        <input
                            type="password"
                            value={password}
                            required
                            onChange={(e) => setPassword(e.target.value)}
                            className="w-full p-2 border rounded mt-1"
                        />
                        </label>
                        <button
                            type="button"
                            onClick={handleLogin}
                            className="button-gradient mt-4 w-full"
                        > Login
                        </button>
                    </form>
                    <p className="text-secondary mt-4">
                        Don&apos;t have an account? <Link href="/signup" className="text-accent">Sign up here</Link>.
                    </p>
                </div>
            </div>
        </div>
    );
}

export default Login

'use client'

import { ChangeEvent, useState } from "react";
import MouseBlob from "../components/MouseBlob"
import Link from "next/link";
import axios from "axios";
import { ToastContainer, ToastOptions, toast } from "react-toastify";
import 'react-toastify/dist/ReactToastify.css';

type Props = {}

const Signup = (props: Props) => {
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [dob, setDob] = useState('');
    const [nationality, setNationality] = useState('India');

    const toast_error_config: ToastOptions = {
        position: 'top-center',
        autoClose:5000,
        theme:'light',
        type:'error'
    }

    const handleCountryChange = (e: ChangeEvent<HTMLSelectElement>) => {
        setNationality(e.target.value);
    };

    const handleSignup = () => {
        console.log('First Name:', firstName);
        console.log('Last Name:', lastName);
        console.log('Email:', email);
        console.log('Password:', password);
        console.log('Date of Birth:', dob);
        console.log('Nationality:', nationality);
       
        if (firstName === '' || lastName === '' || email === '' || password === '' || dob === '' || nationality === '') {
            return toast("Please fill in all the required fields.", toast_error_config);
        }

        axios.post("http://localhost:5000/signup", {
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            dob: dob,
            nationality: nationality
        })
        .then(response => {
                console.log(response)
                console.log("Signup successful!");
                toast("Signup successful!", { type: 'success' });
        })
        .catch(error => {
            console.error("Server error:", error);
            toast("Server error. Please try again later.", toast_error_config);
        });
        
        setFirstName('');
        setLastName('');
        setEmail('');
        setPassword('');
        setDob('');
        setNationality('India');
  };
    return (
        <div>
            <MouseBlob></MouseBlob>
            <div className="div-component bg-text min-h-screen flex items-center justify-center">
                <div className="transition-opacity p-8 rounded-3xl shadow-2xl w-[28rem] z-10 translate-y-[-5rem]">
                    <h1 className="text-3xl font-bold text-primary mb-4 font-heading">Welcome to <span className="text-gradient">Readit</span></h1>
                    <p className="text-secondary mb-4">Please create your account.</p>
                    <form>
                        <div className="grid grid-cols-2 gap-4">
                            <div>
                                <label className="block mb-2 text-secondary">First Name:</label>
                                <input
                                    type="text"
                                    value={firstName}
                                    onChange={(e) => setFirstName(e.target.value)}
                                    required
                                    className="w-full p-2 border rounded mt-1"
                                />
                            </div>
                            <div>
                                <label className="block mb-2 text-secondary">Last Name:</label>
                                <input
                                    type="text"
                                    value={lastName}
                                    onChange={(e) => setLastName(e.target.value)}
                                    required
                                    className="w-full p-2 border rounded mt-1"
                                />
                            </div>
                        </div>
                        <label className="block mb-2 text-secondary">Email:</label>
                        <input
                            type="email"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            required
                            className="w-full p-2 border rounded mt-1"
                        />

                        <label className="block mb-2 text-secondary">Password:</label>
                        <input
                            type="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            required
                            className="w-full p-2 border rounded mt-1"
                        />

                        <label className="block mb-2 text-secondary">Date of Birth:</label>
                        <input
                            type="date"
                            value={dob}
                            onChange={(e) => setDob(e.target.value)}
                            required
                            className="w-full p-2 border rounded mt-1"
                        />

                        <label className="block mb-2 text-secondary">Nationality:</label>
                        <select name="country" className="w-full p-2 border rounded mt-1 focus:outline-none focus:border-accent"  onChange={handleCountryChange}>
                            <option value="India">India 🇮🇳</option>
                            <option value="USA">United States of America 🇺🇸</option>
                            <option value="Germany">Germany 🇩🇪</option>
                            <option value="Canada">Canada 🇨🇦</option>
                            <option value="Australia">Australia 🇦🇺</option>
                            <option value="Japan">Japan 🇯🇵</option>
                            <option value="Brazil">Brazil 🇧🇷</option>
                            <option value="South Africa">South Africa 🇿🇦</option>
                            <option value="United Kingdom">United Kingdom 🇬🇧</option>
                        </select>
                        <button
                            type="button"
                            onClick={handleSignup}
                            className="button-gradient mt-4 w-full"
                        >
                            Sign Up
                        </button>
                    <p className="text-secondary mt-4">
                        Already have an account? <Link href="/login" className="text-accent">Login here</Link>.
                    </p>
                    </form>
                </div>
            </div>
            <ToastContainer></ToastContainer>
        </div>
    )
}

export default Signup

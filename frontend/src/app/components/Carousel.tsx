'use client'

import Image from "next/image"
import { useState } from "react"

import conf1 from "@/assets/conf-1.jpg"
import conf2 from "@/assets/conf-2.jpg"
import conf3 from "@/assets/conf-3.jpg"
import conf4 from "@/assets/conf-4.jpg"

const Carousel = () => {
    const [currentIndex, setCurrentIndex] = useState(0);
    const slides = [conf4, conf1, conf3, conf2]

    const handleClick = (change: number) => {
        if (currentIndex === 0 && change === -1) {
            change = slides.length - 1
        }

        setCurrentIndex((currentIndex + change) % slides.length)
    }

    return (
        <div className="relateive w-full h-full">
            <Image
                alt="Carousel"
                src={slides[currentIndex]}
                className="rounded-3xl"
            ></Image>
            <div className="flex justify-between">
                <div>
                    <button className="hover:text-secondary hover:bg-text rounded-full py-3 px-5" onClick={() => {handleClick(-1)}}>&lt;</button>
                    <button className="hover:text-secondary hover:bg-text rounded-full py-3 px-5" onClick={() => {handleClick(1)}}>&gt;</button>
                </div>
                <div className="-translate-x-5 translate-y-3.5">
                    {currentIndex + 1}/{slides.length}
                </div>
            </div>
        </div>
    )
}

export default Carousel

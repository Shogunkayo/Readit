'use client'

import Image from "next/image"
import { useCallback, useEffect, useRef, useState } from "react"

import conf1 from "@/assets/conf-1.jpg"
import conf2 from "@/assets/conf-2.jpg"
import conf3 from "@/assets/conf-3.jpg"
import conf4 from "@/assets/conf-4.jpg"

const Carousel = () => {
    const timerRef = useRef(0);
    const [currentIndex, setCurrentIndex] = useState(0);
    const slides = [conf4, conf1, conf3, conf2]

    const handleClick = useCallback((change: number) => {
        if (currentIndex === 0 && change === -1) {
            change = slides.length - 1
        }

        setCurrentIndex((currentIndex + change) % slides.length)
    }, [currentIndex, slides.length])

    useEffect(() => {
        if (timerRef.current) {
            clearTimeout(timerRef.current)
        }
        
        timerRef.current = window.setTimeout(() => {
            handleClick(1);
        }, 5000)

        return () => {
            if (timerRef.current) {
                clearTimeout(timerRef.current)
            }
        }

    }, [handleClick])

    return (
        <div className="relateive w-full h-full">
            <div className="hidden translate-x-[-0px]"></div>
            <div className="hidden translate-x-[-512px]"></div>
            <div className="hidden translate-x-[-1024px]"></div>
            <div className="hidden translate-x-[-1536px]"></div>
            <div className="flex w-[512px] overflow-x-hidden">
                {slides.map((_, slideIndex) => (
                    <Image
                        alt="Carousel"
                        key={slideIndex}
                        src={slides[slideIndex]}
                        className={`rounded-3xl translate-x-[-${currentIndex * 512}px]`}
                        style={{transition: "transform ease-in-out 0.5s"}}
                    ></Image>
                ))}
            </div>
            <div className="flex justify-between">
                <div>
                    <button className="button-black rounded-full py-3 px-5" onClick={() => {handleClick(-1)}}>&lt;</button>
                    <button className="button-black rounded-full py-3 px-5" onClick={() => {handleClick(1)}}>&gt;</button>
                </div>
                <div className="-translate-x-5 translate-y-3.5 text-primary">
                    {currentIndex + 1}/{slides.length}
                </div>
            </div>
        </div>
    )
}

export default Carousel

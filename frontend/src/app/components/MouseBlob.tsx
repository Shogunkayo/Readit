import React, { useEffect } from 'react'

type Props = {}

const MouseBlob = (props: Props) => {

    useEffect(() => {
        const blob = document.getElementById("blob")
        
        if (blob) {
            document.body.onpointermove = event => {
                const {clientX, clientY} = event;
                blob.animate({
                    left: `${clientX}px`,
                    top: `${clientY < screen.height - 400 ? clientY : screen.height - 400}px`
                }, {duration: 3000, fill:"forwards"})
            }
        }
    }, [])

    return (
        <>
            <div id="blob" className="absolute bg-secondary z-0 h-[500px] aspect-square left-1/2 top-1/2 translate-x-[-50%] translate-y-[-50%] rounded-full
                bg-gradient-to-r from-primary to-accent"></div>
            <div id="blur" className="w-full min-h-screen absolute z-[2] backdrop-blur-[200px] top-[89px] rounded-3xl"></div>
        </>
    )
}

export default MouseBlob

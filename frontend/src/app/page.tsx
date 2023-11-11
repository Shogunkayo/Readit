import Carousel from "./components/Carousel";
import Explore from "./components/Explore";
import Search from "./components/Search";
import Topbar from "./components/Topbar";

export default function Home() {
    
    const explore = [
        {title: "Upcoming Conferences", url:null, color:"accent", layout:"col-span-3 row-span-3", h:"h-[26.5rem]"},
        {title: "New Publications", url:null, color:"background", layout:"col-span-4 row-span-3", h:"h-[26.5rem]"},
        {title: "All Domains", url:null, color:"primary", layout:"row-span-4 row-start-4", h:"h-[26.5rem]"},
        {title: "Chemistry", url:null, color:"secondary", layout:"col-span-2 row-span-2 row-start-4", h:"h-[13rem]"},
        {title: "Mathematics", url:null, color:"primary", layout:"col-span-2 row-span-2 row-start-4", h:"h-[13rem]"},
        {title: "Physics", url:null, color:"secondary", layout:"col-span-2 row-span-2 row-start-4", h:"h-[13rem]"},
        {title: "Medicine", url:null, color:"background", layout:"row-span-2 col-span-2 col-start-2 row-start-6", h:"h-[13rem]"},
        {title: "Astrophysics", url:null, color: "secondary", layout:"col-span-2 row-span-2 col-start-4 row-start-6", h:"h-[13rem]"},
        {title: "Computer Science", url:null, color:"background", layout:"col-span-2 row-span-2 col-start-6 row-start-6", h:"h-[13rem]"},
    ]

    return (
        <div className="bg-text">
            <main className="relative">
                <div className="bg-primary hidden"></div>
                <Topbar></Topbar>
                <div className="bg-secondary div-component flex justify-center">
                    <div>
                        <h1 className="font-heading text-[5.5rem]" style={{'wordSpacing': 36, "lineHeight": 1.2}}><span className="space-x-48 text-gradient">Spearheading</span><br/><span className="underline">Cutting-Edge</span><span className="text-gradient"> Research</span></h1>
                        <h1 className="text-right underline font-heading text-[5.5rem]">Exploration</h1>
                        <Search></Search>
                    </div>
                </div>
                <div className="absolute text-md top-96 left-96">
                     Engage in stimulating scientific discussions, <br/> fostering knowledge exchange and collaboration.
                </div>
                <div className="absolute text-md top-28 right-96">
                    Showcase your research publications <br/> and projects with our vibrant community 
                </div>
                <div className="bg-background div-component">
                    <div>
                        <button className="button-black">About Us</button>
                    </div>
                    <div className="flex justify-evenly">
                        <div className="w-1/4">
                            <h1 className="text-4xl font-heading" style={{'lineHeight': 1.2}}>Connecting Scientists and <br/>Researchers Globally</h1>
                            <p className="font-body text-lg">Welcome to ReadIt, an innovative academic website designed to foster collaboration, knowledge sharing, and networking within the global scientific community. Our platform serves as a dynamic hub where scientists and researchers can connect, share insights, and showcase their groundbreaking research findings.</p>
                        </div>
                        <div>
                            <Carousel></Carousel> 
                        </div>
                    </div>
                </div>
            </main>
            <div className="grid grid-cols-7 grid-rows-10 mx-1">
                {explore.map((block, i) => (
                    <div key={i} className={`${block.layout}`}>
                        <Explore title={block.title} url={block.url} color={block.color} height={block.h}></Explore>
                    </div>
                ))}
            </div>
        </div>
    )
}

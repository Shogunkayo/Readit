import Carousel from "./components/Carousel";
import Search from "./components/Search";
import Topbar from "./components/Topbar";

export default function Home() {
    
    return (
        <div className="bg-text">
            <main>
                <Topbar></Topbar>
                <div className="bg-secondary div-component flex justify-center">
                    <div>
                        <h1 className="font-heading" style={{"fontSize": 92, 'wordSpacing': 36, "lineHeight": 1.2}}><span className="space-x-48 text-accent">Spearheading</span><br/><span className="underline">Cutting-Edge</span><span className="text-accent"> Research</span></h1>
                        <h1 className="text-right underline font-heading" style={{"fontSize": 92}}>Exploration</h1>
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
        </div>
    )
}

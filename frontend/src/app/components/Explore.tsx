import conf5 from "@/assets/conf-5.jpg"
import Image from "next/image"
import Table from "./Table"

type Props = {
    title: string,
    url: string | null
    color: string
    height: string
}

const Explore = (props: Props) => {

    const newPublicationsColumns = ["Title", "Authors", "Published"];

    const newPublicationsData = [
      {
        title: "[publication title]",
        authors: "[authors]",
        published: "[journal/conference]",
      },
      {
        title: "[publication title]",
        authors: "[authors]",
        published: "[journal/conference]",
      },
      {
        title: "[publication title]",
        authors: "[authors]",
        published: "[journal/conference]",
      },
      {
        title: "[publication title]",
        authors: "[authors]",
        published: "[journal/conference]",
      },
    ];

    return (
        <div className={`bg-${props.color} rounded-3xl m-0.5 ${props.height} relative`}>
            <div className="flex justify-between p-5">
                {props.title === "Upcoming Conferences" && (
                    <div className="bg-text w-full h-full absolute top-0 left-0 rounded-3xl">
                        <Image src={conf5} alt="conf" layout="fill" className="rounded-3xl z-0 object-cover opacity-20"></Image> 
                    </div>
                )}
                <h3 className={`text-2xl p-3 font-heading z-10 
                    ${props.title === "All Domains" && ("absolute rotate-[270deg] text-3xl left-0 top-40 text-background")}
                    ${(props.title === "Upcoming Conferences" || props.title === "New Publications")&& ("text-gradient")}`}
                >{props.title}</h3>
                <button className="button-circle z-10 absolute right-5">&gt;</button>
            </div>
            {props.title === "New Publications" && <Table data={newPublicationsData} columns={newPublicationsColumns}></Table>}
        </div>
    )
}

export default Explore

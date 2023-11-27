export interface newPublication {
    title: string,
    doi: string,
    c_id: string,
    published: string,
    r_id: string,
    authors: string
}

interface newPublicationData {
    data: newPublication [] | [] 
}

type Props = { }

const Table = async (props: Props) => {
    const columns = ["Title", "Authors", "Published"];
    const response = await fetch('http://localhost:5000/new') 
    const data : newPublicationData = await response.json()
    const newPublications = data["data"]

    return (
        <div className="overflow-x-hidden z-20">
            <table className="w-[90%] m-auto border-separate rounded-3xl">
                <thead>
                    <tr className="bg-secondary">
                        {columns.map((column, index) => (
                            <th key={index} className={`py-2 px-4 text-text
                                ${index === 0 && "rounded-tl-3xl"}
                                ${index === columns.length - 1 && "rounded-tr-3xl"}`}
                            >{column}
                            </th>
                        ))}
                    </tr>
                </thead>
                <tbody>
                    {newPublications.map((item, rowIndex) => (
                        <tr key={rowIndex} className={rowIndex % 2 === 0 ? 'bg-primary' : 'bg-secondary'}>
                            {columns.map((column, colIndex) => (
                                <td key={colIndex} className={`py-3 px-4 text-text 
                                    ${rowIndex === newPublications.length - 1 && colIndex === 0 && "rounded-bl-3xl"}
                                    ${rowIndex === newPublications.length - 1 && colIndex === columns.length - 1 && "rounded-br-3xl"}`}
                                >{item[column.toLowerCase()]}
                                </td>
                            ))}
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}

export default Table

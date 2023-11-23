'use client'

import { RootState } from "@/app/redux/store"
import axios from "axios"
import { useEffect, useState } from "react"
import { useSelector } from "react-redux"

export interface userProfile {
    dob: Date,
    email: string,
    first_name: string,
    last_name: string,
    h_index: number,
    no_citations: number,
    page_visits: number,
    r_id: string,
    nationality: string
}

export interface paper {
    conf_id: string,
    conf_name: string,
    doi: string,
    domain: string,
    p_citations: number,
    paper_url: string,
    published_date: Date,
    title: string
}

interface userPapers {
    papers: paper [] | []
}

interface follow {
    first_name: string,
    last_name: string,
    r_id: string
}

interface userSocial {
    following: follow [] | []
    followers: follow [] | []
}

interface userCompany {
    comp_city: string,
    comp_country: string,
    comp_id: string,
    comp_name: string
}

interface userUniversity {
    dep_id: string,
    dep_name: string,
    uni_city: string,
    uni_country: string,
    uni_id: string,
    uni_name: string
}

interface userOrganization {
    org_name: string,
    org_id: string
}

interface userWork {
    comp: null | userCompany,
    uni: null | userUniversity,
    org: null | userOrganization
}

const Profile = ({params}: {params: {id: string}}) => {
    const user = useSelector((state: RootState) => state.auth.user)
    const [userProfile, setUserProfile] = useState<userProfile>({})
    const [userSocial, setUserSocial] = useState<userSocial>({"following": [], "followers": []})
    const [userPapers, setUserPapers] = useState<userPapers>({"papers": []})
    const [userWork, setUserWork] = useState<userWork>({"comp": null, "uni": null, "org": null})
    const [view, setView] = useState("about")

    const getTotalCitations = () => {
        let citations = 0
        for (const paper of userPapers["papers"]) {
            citations += paper['p_citations']
        }
        return citations
    }

    const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

    const getMonthYear = (date: Date) => {
        return monthNames[date.getMonth()] + " " + date.getFullYear()
    }

    useEffect(() => {
        axios.get(`http://localhost:5000/profile?r_id=${params.id}`)
            .then(async response => {
                if(!response.data)
                    console.log("error getting profile")
                setUserProfile(response.data)

                axios.get(`http://localhost:5000/papers?r_id=${params.id}`)
                    .then(async response => {
                        if(!response.data)
                            console.log("error getting papers")
                        console.log(response.data)
                        setUserPapers(response.data)
                        
                        axios.get(`http://localhost:5000/social?r_id=${params.id}`)
                            .then(async response => {
                                if(!response.data)
                                    console.log("error getting social")
                                setUserSocial(response.data)

                                axios.get(`http://localhost:5000/work?r_id=${params.id}`)
                                    .then(async response => {
                                        if(!response.data)
                                            console.log("error getting work")
                                        setUserWork(response.data)
                                    })
                            })
                    })
            })
    }, [params.id])

    return (
        <div>
            <div className="div-component bg-secondary">
                <h2>{userProfile['first_name']} {userProfile['last_name']}</h2>
                {userWork["uni"] !== null && (
                    <div>
                        <h4>Department of {userWork["uni"]["dep_name"]} | {userWork["uni"]["uni_name"]}</h4>
                        <p>{userWork["uni"]["uni_city"]}, {userWork["uni"]["uni_country"]}</p>
                    </div>
                )}
                {userWork["uni"] === null && userWork["comp"] !== null && (
                    <div>
                        <h4>{userWork["comp"]["comp_name"]}</h4>
                        <p>{userWork["comp"]["comp_city"]}, {userWork["comp"]["comp_country"]}</p>
                    </div>
                )}
                {userWork["uni"] === null && userWork["comp"] === null && userWork["org"] !== null && (
                    <div>
                        <h4>{userWork["org"]["org_name"]}</h4>
                    </div>
                )}
                {user && params.id === user.id && (<button>Change Details</button>)}
                {user && params.id !== user.id && (<button>Follow</button>)}
            </div>
            <div>
                <nav className="div-component bg-primary">
                    <button onClick={() => setView("about")}>About</button>
                    <button onClick={() => setView("papers")}>Papers</button>
                </nav>
                <div className="div-component bg-background">
                    {view === "about" && (
                        <div>
                            <div>
                                <h2>{userPapers['papers'].length}</h2>
                                <p>Papers</p>
                            </div>
                            <div>
                                <h2>{userProfile['h_index']}</h2>
                                <p>H-Index</p>
                            </div>
                            <div>
                                <h2>{userProfile['page_visits']}</h2>
                                <p>Page Visits</p>
                            </div>
                            <div>
                                <h2>{getTotalCitations()}</h2>
                                <p>Citations</p>
                            </div>
                            {userWork["org"] !== null && (
                                <div>
                                    <h2>{userWork["org"]["org_name"]}</h2>
                                    <p>Organization</p>
                                </div>
                            )}
                        </div>
                    )}
                    {view === "papers" && (
                        <div>
                            {userPapers["papers"].map((paper, idx) => (
                                <div key={idx}>
                                    <div>
                                        <h3>{paper['title']}</h3>
                                    </div>
                                    <div>
                                        <p>{paper['conf_name']}</p>
                                        <p>{getMonthYear(new Date(paper['published_date']))}</p>
                                        <p>{paper['p_citations']} citations</p>
                                    </div>
                                </div>
                            ))}
                        </div>
                    )}
                </div>
            </div>
            <div className="div-component bg-secondary">
                <div>
                    <h3>Followers</h3>
                    <div>
                        {userSocial["followers"].map((follower, idx) => (
                            <div key={idx}>
                                <p>{follower['last_name']}, {follower['first_name']}</p>
                            </div>
                        ))}
                    </div>
                </div>
                <div>
                    <h3>Following</h3>
                    <div>
                        {userSocial["following"].map((following, idx) => (
                            <div key={idx}>
                                <p>{following['last_name']}, {following['first_name']}</p>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Profile

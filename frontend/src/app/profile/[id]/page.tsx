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

    const handleFollow = () => {
        if (user && user.r_id !== params.id){
            axios.post("http://localhost:5000/profile/follow",
                JSON.stringify({
                    "follower": user.r_id,
                    "following": params.id,
                    "token": user.token
                    }),
                {headers: {
                    "Content-Type": "application/json"
                }}
            )
            .then(response => {
                console.log(response.data)
            })
        }
    }

    const handleUnFollow = () => {
        if (user && user.r_id !== params.id){
            axios.post("http://localhost:5000/profile/unfollow",
                JSON.stringify({
                    "follower": user.r_id,
                    "following": params.id,
                    "token": user.token
                    }),
                {headers: {
                    "Content-Type": "application/json"
                }}
            )
            .then(response => {
                console.log(response.data)
            })
        }
    }

    const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

    const getMonthYear = (date: Date) => {
        return monthNames[date.getMonth()] + " " + date.getFullYear()
    }

    useEffect(() => {
        if (user && user.r_id !== params.id) {
            axios.post("http://localhost:5000/profile/visit",
                JSON.stringify({
                    "visitor": user.r_id,
                    "visitorOf": params.id,
                    "token": user.token
                    }),
                {headers: {
                    "Content-Type": "application/json"
                }}
            )
                .then(response => {
                    console.log(response.data)

                    axios.get(`http://localhost:5000/profile?r_id=${params.id}`)
                        .then(async response => {
                            if(!response.data)
                                console.log("error getting profile")
                            setUserProfile(response.data)

                            axios.get(`http://localhost:5000/papers?r_id=${params.id}`)
                                .then(async response => {
                                    if(!response.data)
                                        console.log("error getting papers")
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
                })
        }
        else {
                    axios.get(`http://localhost:5000/profile?r_id=${params.id}`)
                        .then(async response => {
                            if(!response.data)
                                console.log("error getting profile")
                            setUserProfile(response.data)

                            axios.get(`http://localhost:5000/papers?r_id=${params.id}`)
                                .then(async response => {
                                    if(!response.data)
                                        console.log("error getting papers")
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
        }
    }, [user, params.id])

    const doesUserFollow = () => {
        console.log(userSocial["followers"], user?.r_id)
        for (let i = 0; i < userSocial["followers"].length; i++) {
            if (userSocial["followers"][i]["r_id"] === user?.r_id) {
                return true
            }
        }
        return false
    }

    return (
        <div>
            <div className="div-component bg-secondary relative">
                <h2 className="text-3xl text-primary p-4">{userProfile['first_name']} {userProfile['last_name']}</h2>
                {userWork["uni"] !== null && (
                    <div className="p-4">
                        <h4 className="text-xl">Department of {userWork["uni"]["dep_name"]} | {userWork["uni"]["uni_name"]}</h4>
                        <p className="text-lg">{userWork["uni"]["uni_city"]}, {userWork["uni"]["uni_country"]}</p>
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
                {user && params.id === user.r_id && (<button className="button-primary absolute right-5 top-5">Change Details</button>)}
                {user && params.id !== user.r_id && !doesUserFollow() && (<button onClick={handleFollow} className="button-primary absolute right-5 top-5">Follow</button>)}
                {user && params.id !== user.r_id && doesUserFollow() && (<button onClick={handleUnFollow} className="button-primary absolute right-5 top-5">Unfollow</button>)}
            </div>
            <div className="flex min-h-[400px]">
                <div className="flex-none w-1/2">
                    <nav className="div-component bg-primary">
                        <button onClick={() => setView("about")} className="button-primary">About</button>
                    </nav>
                    <div className="div-component bg-background h-[320px]">
                        <div className="flex justify-evenly items-center h-full flex-wrap">
                            <div className="p-10">
                                <h2 className="text-3xl">{userPapers['papers'].length}</h2>
                                <p>Papers</p>
                            </div>
                            <div className="p-10">
                                <h2 className="text-3xl">{userProfile['h_index']}</h2>
                                <p>H-Index</p>
                            </div>
                            <div className="p-10">
                                <h2 className="text-3xl">{userProfile['page_visits']}</h2>
                                <p>Page Visits</p>
                            </div>
                            <div className="p-10">
                                <h2 className="text-3xl">{getTotalCitations()}</h2>
                                <p>Citations</p>
                            </div>
                            {userWork["org"] !== null && (
                                <div className="p-10">
                                    <h2 className="text-3xl">{userWork["org"]["org_name"]}</h2>
                                    <p>Organization</p>
                                </div>
                            )}
                        </div>
                    </div>
                </div>
                <div className="div-component bg-primary flex-auto flex justify-evenly">
                    <div className="div-component bg-background w-1/2">
                        <h3 className="text-xl text-primary text-center">Followers</h3>
                        <div>
                            {userSocial["followers"].map((follower, idx) => (
                                <div key={idx} className="p-2 m-1 bg-secondary rounded-3xl">
                                    <p className="p-2">{follower['first_name']} {follower['last_name']}</p>
                                </div>
                            ))}
                        </div>
                    </div>
                    <div className="div-component bg-background w-1/2">
                        <h3 className="text-xl text-primary text-center">Following</h3>
                        <div>
                            {userSocial["following"].map((following, idx) => (
                                <div key={idx} className="p-2 m-1 bg-secondary rounded-3xl">
                                    <p className="p-2">{following['first_name']} {following['last_name']}</p>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </div>

            <div className="div-component bg-background">
                <h2 className="text-3xl text-center text-primary p-4">Publications</h2>
                {userPapers["papers"].map((paper, idx) => (
                    <div key={idx} className="bg-secondary rounded-3xl p-5 m-2">
                        <div>
                            <h3 className="text-2xl">{paper['title']}</h3>
                        </div>
                        <div className="relative">
                            <p>{paper['conf_name']}</p>
                            <p>{getMonthYear(new Date(paper['published_date']))}</p>
                            <h2 className="absolute right-5 bottom-5 text-2xl text-gradient">{paper['p_citations']} citations</h2>
                        </div>
                    </div>
                ))}
            </div>
        </div>
    )
}

export default Profile

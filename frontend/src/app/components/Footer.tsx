
type Props = {}

const Footer = (props: Props) => {
    return (
        <footer className="bg-text div-component">
            <div className="container mx-auto py-10">
                <div className="flex justify-between items-center">
                    <div>
                        <h1 className="text-2xl font-semibold text-gradient">Readit</h1>
                        <p className="text-sm text-background"> © {new Date().getFullYear()} All rights reserved.</p>
                    </div>
                    <div>
                        <ul className="flex space-x-4">
                            <li>
                                <a href="#" className="text-background hover:text-secondary">Home</a>
                            </li>
                            <li>
                                <a href="#" className="text-background hover:text-secondary">About</a>
                            </li>
                            <li>
                                <a href="#" className="text-background hover:text-secondary">Contact</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    )
}

export default Footer

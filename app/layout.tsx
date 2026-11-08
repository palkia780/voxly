import './globals.css'; import type { Metadata } from 'next';
export const metadata:Metadata={title:'VOXLY — Your space to talk',description:'Communauté, messages et vocal'};
export default function RootLayout({children}:{children:React.ReactNode}){return <html lang="fr"><body>{children}</body></html>}

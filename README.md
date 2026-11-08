# VOXLY — déploiement réel

Cette version est une base Next.js/Supabase déployable (et non un HTML local). Elle comprend l'inscription/connexion Supabase et les messages de salon en temps réel avec RLS. Le vocal est préparé via une route de jeton LiveKit; il faut encore intégrer l'interface LiveKit dans le salon et paramétrer le projet.

## Installation
1. Crée un projet Supabase sur https://supabase.com.
2. Dans SQL Editor, exécute `supabase/schema.sql`.
3. Dans Authentication > URL Configuration, ajoute l'URL de ton hébergeur dans Site URL et Redirect URLs.
4. Copie `.env.example` en `.env.local` et renseigne URL + anon key Supabase. Les clés service-role et LiveKit restent côté serveur, jamais en `NEXT_PUBLIC_`.
5. `npm install`, puis `npm run dev`; vérifie `npm run build`.
6. Déploie sur Vercel (import du dépôt GitHub) et configure les mêmes variables dans Project Settings > Environment Variables.

## Variables
- `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`: public (protégées par RLS).
- `SUPABASE_SERVICE_ROLE_KEY`: serveur uniquement si nécessaire.
- `LIVEKIT_URL`, `LIVEKIT_API_KEY`, `LIVEKIT_API_SECRET`: serveur uniquement.

## État honnête
- Auth réelle : oui, Supabase.
- Messages persistants et realtime : oui, table `messages` + Supabase Realtime.
- RLS : lecture pour utilisateurs authentifiés, insertion uniquement par leur propre user ID.
- Vocal : endpoint de jeton sécurisé prêt, mais UI de connexion LiveKit à compléter.
- Uploads, amis, invitations, serveurs multi-tenant, modération STT/dB SPL et panel admin : non implémentés dans ce starter. Les dB SPL exigent calibration matérielle; la transcription vocale exige un service STT et consentement clair.
- La modération et les permissions doivent être contrôlées côté serveur avant production. Ne déploie pas en promettant la modération automatique tant qu'elle n'est pas intégrée/testée.

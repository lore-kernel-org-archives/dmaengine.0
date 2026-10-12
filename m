Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C7495501;
	Mon, 12 Oct 2026 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817953; cv=fail; b=ZdJwzzG13NG73cHlx2PA6RQ1cMa128aIyx4siwD7MleuWS/GyHKvAzgyUFscQ1ZnwmqQ0MK764uH3n8//XVW4diaX+YkatB4wO+AIP1qadMxGP2ET1hgvAAr3hOHEqVDWzbm/3U1ri+qzWLirwIDORUJ9GuHN+jVfzrIdVwT7IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817953; c=relaxed/simple;
	bh=246lUTh84wes9rVp5+feMfGNJO2SgItFiQRXinm/DoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BbiTxdbyAa5hdROZcwQOT9H7DWjTQb1/zQ5usyUpHz1zZluHchJuy167CZPaayftOP3PEAO3AJhjdMvBB9N2lz2IPfifUX3dCNhbddRcjAf7vWimdQnhJqc1fxOFFJz+3pxyYTWk2WBPajpICSitihdp2xfuVnd7ny8fAhD9LtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WtAC90JJ; arc=fail smtp.client-ip=52.101.69.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WtAC90JJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BV7Iq7fHVZbMKJ2Y9+ycCc3Ehkz60vihLoSMAZExpjIxRRUgyrkTNq1egS/9FcQsXMzXuVtcEhPpe19nQjLTuwo7+wHnm/Za2iUCy0FjhuyNGEpBqLJ/p4mOPF3lf1KVkb8e0LG6VJrHJlAJ6/3HHchA/Qyf0Kxk7NSBsgwTWNptv9pFSjRHAN/t3c1lNmMxw5tfBS1z4fj3lIqGvmEhXHyKFotXeXYW+HNLRkE0P8/UiDilp6OnrhVEqbASyma663QA9izWe8iqBBkhQ1PQ0aQeWiFghd/Ea2+AbgSeNE+iDCc3qAuaJRuv3Ky8LzX+D2NYBeamB0SS98tT+qrNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=246lUTh84wes9rVp5+feMfGNJO2SgItFiQRXinm/DoU=;
 b=o4gTYm1sQOnd+JbFRkTFB4dE9Uxchl9aos48rQTestVKidC4TK8WbauNmUV2iG+ASXc7TXcHmQyMhY5aTbK+3UBgSRNPvJGLDxziSztPa2/Ye04nNgWTzLG6hao4k1F2CPSR7EoadLRocblK3PgYUg3BwnqcGvNUeNkxQz2hSn8TD0oKFTfFJNez/iDxJkrL0Kw6F1eVbB0zJ5Zm4wCoRrtwJn8VexH8szerBSzfpsZKYrrldirzJdpn3T9xO7bNdECywI7peyq0alq+svsajfIyROSMTWsF2jy8kat48m77/O5DesKYyqowJU4b6WlZfJNxOxx3b8jLxfHS3EDMyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=246lUTh84wes9rVp5+feMfGNJO2SgItFiQRXinm/DoU=;
 b=WtAC90JJRoMZasEAlz3pBKKkhCuOVbpoOjWkeBYHlryCNQYmWoljPcNwYvqS8nCHW9NR18aSUuIdhkN9EDRGQGAGNy8kDvs6iz6iFjRUC8i5zrkL63omFNiQSogAhUSOdeJFJQk2GdFS66MJkUb4HPCv4DQPhOgXYXJQofYbgwHuIDGLMU/gSyc4Wfrjo5XBXurCemhfSK6nQi4rxIUi/K8XOk5uSOoeh2uZ+lBvu7bZ2/bJdQExKKwvSB8ZgeHNjG/t9a9ASAXMtdhCZGEWo/1h6DgDiesbS9a66HJU04xZmittHIHQb59/RQsmIrDPPeZ0VPJDcxyYm62Phs9YDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7811.eurprd04.prod.outlook.com (2603:10a6:20b:236::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 15:12:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 15:12:29 +0000
Date: Mon, 12 Oct 2026 10:12:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] dmaengine: arm-dma350: Add slave support and CIX
 Sky1 integration
Message-ID: <asz41HFj_wkgooln@SMW015318>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: PH7P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a4fd7b-9f20-4718-f6d0-08df28733b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|7416014|6133799003|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XQX6hpZK01Gh6FMZHLBinfH8JjiKM8hvX30gwY8UF6huU2RHJaHhgzU/NvDYnAinKqBPDbVQHScM1HNfHWg5VQ63NJ913t0nixuOCPKoO6kQUo2I/RwaeLQHsGn7f9XkhVMHppHxzHO4mZ75spLlh1hTszIbrFRZt4g+ETHA6sQ9LjfyrKPyfI/k5qj9wwwyh8/NhOBIK2/L0WQ2SS9tyzRlHvEeWCwRmgLTxejvZ4tPOEVIJ+JG10a23Op/Aw0yxX73ixoDblCafgvqN+Rx5/4oumv3E8JPV/dJEyXAuFKY7hAJMajzEj+IbfKkxugH08a/JKGcPYjl0rNo9SPM20FsFFSIQwVw1hNiOUcfaQPUPjHR0JQ+HaLebH8KwWJWuZB1OV7a5iz9+6MA+UtqMTTVZ9f3RyuqLiLRIgWqLKPPPeeTeRlFH/0f1r078rghfjVTfDLbGUMa+YEOzXft3D3R8cwnopEM+wbjI1EWvPDtrYbMC25W20KUgQQr06AJqqvDsUbhX5IRbCEM1LO6lTtkUSJxzaqRLBkYebbewyLMKF7SkI5TrmewxQdjs43RARPI/FOvK5/G7Jc2r+iOMZg8doHWskOvUve1y5X+el4lVuUJQNhxSwGBhpZXiS0AViWXtJ5SY3MvzpxfHl45iwp9pI/eqbNq6B/Q98zp65g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(7416014)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NGndspdE6rPQDlEQxF0eC5+A5mPyxxPMVYcIVjmFpyHom8cMvfug/2ODCEm3?=
 =?us-ascii?Q?Msbtw3JcN/FBOOXaM23nKkwgm7nj0Uf2t3X5rPvoBQw+yO0mFaayFMNTFgTG?=
 =?us-ascii?Q?r8LzNR+JcZy4ibDP0NiR2gdy3q/nQyrtN2boYy6j66kPvfbjGO/uUT2Yr81s?=
 =?us-ascii?Q?N8F6trL8ugUgtH4k5R9vy8fNcxT6f1R4BzgyuocYcMkQwniI8aTMbg5lihUK?=
 =?us-ascii?Q?Fn80D3udMNi+/RtvL+mCJc4ukN6BXZiuikYwhcYR0cEBA+/tStV8LyhZbA8K?=
 =?us-ascii?Q?+IPuOsZyzakSgJ2pYjFCgKSp8LHHuJcJB8zQluFf9NTaoonGPUPR7z1WWU4X?=
 =?us-ascii?Q?951B0nvu1V0v1SvW+jgJ/DWqbYwxw9oHv1oV29FeijhP6kNOgVLe1J7gqzAe?=
 =?us-ascii?Q?UOZuIJPKvfD7FivTpj8IgS7seRkTaCcfmumsXRALyHph0NpnE8lFdIGx+WtO?=
 =?us-ascii?Q?7Or9jVoMyOYDZINUAn3LNS7KTNAMBEN+DBeSwWR1h2Ftd5gY3rAU12Xkj+CL?=
 =?us-ascii?Q?NQ8fX6aPqsyaIXZ2IJaGY+d7QfYK43ZT+JG7EoAL7zUuFivjP98FBpwHoOGW?=
 =?us-ascii?Q?DpX31BmNciNXAbVJWS6HXrkS1ZIYktkRHh8NPE2nmgjEkSTsTolzvlm2qi6q?=
 =?us-ascii?Q?6eipIt3VWlm2vhhBDdCtArSjkCI/gFWp9qkTCfnNeeVhkEhIO4IPOMzsQOmt?=
 =?us-ascii?Q?/ZtkxpIVEEvqPH45dxmWorS7i+WZR/DbxDgzgxy8eVNfrRRzFSQ8VdSUYCp8?=
 =?us-ascii?Q?sBrU7U0t9m92IJ3nykPFl+HiVQfNzPVQw/KXQ9mYZEGLzXZFJWBZh+Kfj456?=
 =?us-ascii?Q?QeplRmLeaXEznGCzRKzkX9hNsH5QaUuFDn9D7/a1qIA4DaaLcdS3QuwshR1t?=
 =?us-ascii?Q?o+4Nt9fkrxVWxPon0c7Drwdyl3tlxrKcuuiXmIk+qsJQYokE5giBraTVUWcj?=
 =?us-ascii?Q?eXu+3XUvrirnnYOV7RZzTRKqTkuUCfozt3dxja1OBbzj8S4OnICRbdEs5Uej?=
 =?us-ascii?Q?+NvXbMRAydkL/bhtQcSoPbfsHIVQqalIPKIFtj7o5cTSydcMoBfapP6Gxsbx?=
 =?us-ascii?Q?1+LWR/6mIXaEvWn2Wsm8iKBPUmK6aZQGZrwClLV42dKAxSUss04G1UAmIw2M?=
 =?us-ascii?Q?TzczNtjd+7bWaDH5PrQZFpQXu5IN68xS1bHCByCOhEdxRHVilgW+thNBhfrF?=
 =?us-ascii?Q?SOQsxnDkewfiZ7BItxhKb8Cyv0pHGZ5ZiZUqJEy0iRanyGvFpPUGBRNQVXUh?=
 =?us-ascii?Q?kb1D+aBZ19ZeM2P3eqLZwwW7hvO2wl9Mt/hXZ7mCPvRpbuc1MfmrL1DSCIWU?=
 =?us-ascii?Q?C+1f5xnZCB2bCkBQkJwk4b6A4jhkeEDFdZj4kG0fcE0/8yqbHOoF5Pq3QvK6?=
 =?us-ascii?Q?M9zunwDoYBovHEAcYIymmM59KIX3W1r3xLi+00gYlLzxMG2jWgwHu1GgumLA?=
 =?us-ascii?Q?YXBbiaq/5ZmSXyyoYAzlU6Lq7roZR43ZJuD9lkgBfq//GyycmeFjTm7UCP5u?=
 =?us-ascii?Q?/ZSnuWC+seOV/T//aG5myuwShwkyTAG6VGXTE+co2q91WLp/YIqgo5LedW0Y?=
 =?us-ascii?Q?7EfrV0MDipngyp6I6+FHYceXUwXqLDBT2M3/+Wl8+J4BZ6Jk4uvlNo/ENe39?=
 =?us-ascii?Q?An6nCikz7Hmup47zqQaPPQve0Zlv3W5IwFWjuhipb8lKsVDzSqpQDdhm8019?=
 =?us-ascii?Q?n5JAPo8CaBPCykxNGBi689A5iU505TWybGs0Uf6eNcC2PPqXCUHAbKtW5XkN?=
 =?us-ascii?Q?nMnSdp6X1uXFGQK3I89yI080UuK539GOxHKrN7Vo8QPtZblSbtQj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a4fd7b-9f20-4718-f6d0-08df28733b86
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 15:12:29.7248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJWrDvIG2s6zvHeDUCElWmM6WjrfS5ol3mncnXDBtB/6Ii9YIfBCC3J/sBHmxInSOeL0fwBBoBG4aJxPK35UYuakhtdvmsPqWi2q8ObcmJnhQunRQZZmGj4VrdX8ozrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7811

On Fri, Oct 09, 2026 at 01:18:40PM +0800, Jelly Jia wrote:
> Hello,
>

Please avoid post new version patch set to old thread, which will mess up
patchworks and other tools.

Frank

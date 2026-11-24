Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795548616;
	b=NtVeZtGooFBxAvOkf+ylVOh72BZj580Ebp3Tp3F3nWnexqqLD8BpktiGo5XrxPdokHLt
	 35M6BaUdBUdNkWAT2kpJOH6twQ5b524A/QqUPBx9dEU2YI5x/YnEaEgtJcPX1UWiDsNln
	 zPTJ5QFJUgF03FHSN4HA6bb31QCYhMRc3PFx/gh30jpCz5NztH0lMdLWuMcNyrVHQPmtm
	 7vAYsXt2szG3yRUaum7zovTynhuCh7ZnJ/hj9xHVXXyVuqU09e7NzBgIGJ6IKwvXBSMdL
	 AT/+bPY/6gu/vMe/ep4IggsahZGtWDpoCsFAdso99Kncg517W+bB85nWSIAJVJzuWDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548616;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=sh/yI+sWbH6dtghnDfs/QpQY6r3isBUMf3UMX0hh+Dg=;
	b=DbqRLHFdtAMrxpVo7x6QmWdmh+MGtrx1SOY6kA7Cak1MpKYJB9aNBhXERqfncNYoXP8z
	 R0+px7BqYhuWEgHdlaD34IUQ5ra3yVckPHArIz2fhhmu7/sCQEno1zIbT0wBZ7qI3G1kv
	 Wgkeb+ayXYSNYDAYcbPgO/zeTVHZpegHOoLaJUMJmN8Nexj4eTEHG4TzrP0JPXBox/oNv
	 rBRV+k+Njbh95pkpYVu0aUOs1LdlY5uK1xE7gQvVNPusAy1nd5VjHKLMqep68TCfenskT
	 /y31ORziPnInXqkkKvTk8/Q4JzvJYh0L0wI8DaNWYLFTTP0uiDb69o/a6rtT+GjwJbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=He2vuy3f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.61
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C3606A326;
	Tue, 24 Nov 2026 19:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=He2vuy3f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDzNRSg8Jdb9TdK4o7jP1tpZGf/k62it0NiCpWcqdoT9KYe8xA0q6FSPFytxLxMch3Ov4o3nBvvdo4lscnDzgiOsZVBrjPACLqXa0ZHv2wGNSdYrQ9ftKa6B/rdTIvnAjFMYmS8QKOzNhdy2QecqOlJi5TnKtFZAPVjMW1Ccvdzn7MBZRIDjcJ7k7SEFBWPPtv7MIkocnye1eMSgp+4JW8ZCkcJ23p9CZZN1fJgJmRMRKeFeTM9OCPKrnkv6aNM3F1Qaph7ASrDebDaIaqAyNB1N5k2vLugTG5cY5HyEsFaktG8WrvPent1BV22kW3i3Um1HXpQa+h7VTWrqsE/LqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh/yI+sWbH6dtghnDfs/QpQY6r3isBUMf3UMX0hh+Dg=;
 b=mldKX7zCNm8IL3Gr5OBACRo9ZHsAhW+PBypaqsKcYO8OsCsWOIVuPSxciPOQMMfylIkEptXEcJfYHlbEuhoJ2WNGj5F1amULn/zmdYdfi6RLJgsE2MAuSNqBDBWdxXKk26VGoGy3mMDYh7lw3qSVu2iQOqVJlGwpSE+k8uNf7AkMxikwU0h0kVD+l03l8sStonYc9GRi8/D7hGBMYpepFIg40CH0znw3DYbv+inqwwhW5CbcAZY5dK9t4YAtblDEQ7z/tLTkEBDoQNYIRUMazoaUrV0t4SxPo93+xTEtCbjL6lHOc+3TIu8v87EJdxvjbGo/yp2LPxfu2PBUkJnyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh/yI+sWbH6dtghnDfs/QpQY6r3isBUMf3UMX0hh+Dg=;
 b=He2vuy3fc/6353vmsUoqdS5thfaLhqPw/Zx5duwpMDh3s861X6NSbHiAWUbU2QDOg7pMKZpg1iWNvbYVdvyexxyI5KEAMMS8t3YNVGBXdx2L2T6VkGKy8nBuV5mm6GMvHDv3zkL2vzN/jH2K/Ljo5UYoa9x0ALXQ8xLTmOfM4wm4csRWDXZ3aoTVlP4MK1FvfdNNhGVaTPuAUVULxDKMucmhfqxC5TRgKmtXIS+I3IJatVn4UIPnqRGQIRTX0QHwCsKXUMh6pCo1ndA6bB4aeHGerb9wIaKDKUeteIp9PIWKRfjSJ7HIOnF6s9mUECdAwegB7+zCDSBtb10/U2LtvQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8430.eurprd04.prod.outlook.com (2603:10a6:10:24f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 19:30:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 19:30:12 +0000
Date: Tue, 24 Nov 2026 14:30:02 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/28] dmaengine: bcm2835: Support dma flags for
 multi-beat burst
Message-ID: <awXluqyLWzdl_Ade@lizhi-Precision-Tower-5810>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-5-andrea.porta@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123145728.29082-5-andrea.porta@suse.com>
X-ClientProxiedBy: PH0PR07CA0109.namprd07.prod.outlook.com
 (2603:10b6:510:4::24) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c96695f-d66b-4a22-6cb5-08df4a615bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|18002099003|22082099003|261009223027099003|261021123027099003|261021121427099003|261026140227099003|261102123227099003|261022105027099003|261026121527099003|261028144727099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	BcGpdFIciV19MmG24ZbmynGDxNJf9wHAW1KILhn7IoWVbT9sHR0dJF1mTz5CgbH/38kBXISMxCoOoUiKO7aBDe40K0pzqEh8/cpeoKNocJO8VMbZ0NqIZdh0VOxCdDlFRVb/wAfZqrDjHtMPkaN/JVolJubjW9p58IqLWIBuJO++Z0w75Ds8SVYhnTWN4isoBuBL0nTr39holcBwDQjuArAQYRi8AtE8N0P3UpGPESR6dS+EmdyIOXwaTQgya1JqJuPERL8kgrSWonmbC2AdQKz0udPta0iUMPWbSJzFNgaLtRqAWNpRFbQ5xHSDkL7f5mmAA8ZX4P4BNOp1YeL7JZHzzYELi74HxJOj3AYF7o8vUYLq5RDBZekxjoraH/RhvFul6Cud7ixGdhsKdDJ1KLrbXy3LG8kafXnT++MojT5Eb6wCB9JgUHNA1/18BLZ+CyKT4zFOvbotenAyw1oDKYdCBltvK1jQMPQd8VXD34oupWuZlTfB3QHf0B+pufbV7K6yOckcUkkgCZMUXGFZmnY0MHuP59NLsNVDsNb1dVOt3mSvO/vUily2+DQi3tjShvwIuNTtBFAugQ+TCCWQw/juLRaRKUpusLSr+MCXMcdbX2SipNXelHY8RIEgkCp5o8a1y08e5aHmO+MCVbxkrMZToOZt2M4Pe69TT8ebvPc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(18002099003)(22082099003)(261009223027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261022105027099003)(261026121527099003)(261028144727099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hLSRnYRupNdNQdpFujYFNVyr1W6KmEFqzidhU4ehszm23fGiAIei7/eVLV5v?=
 =?us-ascii?Q?Heb/1VFSvNn9xq2phO/1k8oM2I1rFrDgYq7oi2q/Zv8CBGXWtDN0tOKjJ81G?=
 =?us-ascii?Q?T7X/4iFhFBFn3gZ4+KawGWX6gZpXe8l2i7b/izaYDauclQ2o0dvL3tkAYBre?=
 =?us-ascii?Q?hcfYbU9seKisuB8SGTIpS0IN3WJ9u6NzQj3F7p67wWPHoRUwP7HKuDYVjUFn?=
 =?us-ascii?Q?NQxSxIj6TJl3Unppwwda05bhxK4WBeElME9k85pyeD42iFSmJaKslI+vHG3Q?=
 =?us-ascii?Q?UDuaFK2qVcbHqt27mV2P+TZmH+by6pp76PXlbJOPKJ8vFCMPVArNVfWmAsUh?=
 =?us-ascii?Q?TQeC7igx16fX4s/aoYu33OOX7bBjhgOcy5kEeBicFD7qGkN2DM/BNCCPbG8M?=
 =?us-ascii?Q?Agfxzri6gRv0fFdgOZt5pLFTqthjHNFIZ+1c/qb3DTrP8q4Ep0CovVdapuiU?=
 =?us-ascii?Q?JxXFkPJtdK1xCWOyt7gKe9GaF2V1ye3WmtunJaxu3lJMIlBhON91QB7FPzLK?=
 =?us-ascii?Q?uZVcOS+U2SErr1SMkmPrMFnzmmdiTxaECBrFy5dNlzgYAN0l79la73Jx/zkw?=
 =?us-ascii?Q?W2Rul06Z5fVrfOk8nQlID3RN4EDd5eQMAbGE0ikpCGPxOxZLLIqViejE6W70?=
 =?us-ascii?Q?/R/dYtueYEtegeKZukzbz+patCAaNdWOcj4BcZzyU0jVP/a9C9jyjZguscBu?=
 =?us-ascii?Q?AUHuhpURZLqlhYTas5glO9RPMARo0lSnN68UtwlPpqBsrZ7r0OZ/eEgYZB5e?=
 =?us-ascii?Q?9tS8aOwh53DDYFcCSN6HzyEYFCVt2slMY9Puif0+BC0oXKFO3//s3IaW11yH?=
 =?us-ascii?Q?1onrDDBMJa0Ad7jX5OB60hWTlusBdsI6ut82s/7GwoUoKr89x1Hl7cZ71+Yu?=
 =?us-ascii?Q?8aWWY6HLsiXsbR6XXb7p4PqVNImov9QMiIlnsFXEM7gnYA+t1ZehcnEljkBM?=
 =?us-ascii?Q?dFN2tR+PApzUYLzRb3m4oq9wb7an8jMhdd34XjDG4DMEPO9rx0pWlOGto+Gy?=
 =?us-ascii?Q?oJvWihuc2gtsdYA6m9JLRoDRv0m6gv2Qpa2zk5tllqC8/Zbl4qEbyqVoGMdE?=
 =?us-ascii?Q?mPsboNvt9ZgBO04PL2CEmU0qrJwUTz+lsgBkr7rH/CfeWY/SrGMCVQVKqRv0?=
 =?us-ascii?Q?6jooF8mZKGoNZ2Vv6LehcTd2ykLpJmpLPnlc4mEhEdcNbdXq2jQRYrYh0NRO?=
 =?us-ascii?Q?Ao3ZpgmNuXvZAOVdjIbNAGrHOnFP/rTJGcIgf/NXvBPNl79sZiYqPNC1JtGu?=
 =?us-ascii?Q?z8uIe156BhEdvBYE3AdOOMUfPyEs/F+GFsrkMwxMeBq8A7Rb54NbdD/Qh8aP?=
 =?us-ascii?Q?TRbFt/3KaKPTT3hD+tVruaA1OKfiUnL+IfqDh3McvMUB5auzeVIbDdJ9yvcG?=
 =?us-ascii?Q?l8DNrVLfedYzMz3ou0IIosppeIqUYSxLpTL0SiMMkSXCRfHg+dNPMsGp65w1?=
 =?us-ascii?Q?MDwPcnLb5fRsEvG9XDd70MSVILCNoitV/SFhoMD99ySEP0twKEiXIu6hWDmE?=
 =?us-ascii?Q?jM0FKIO1tcPvSgY5c7vrnbS79TT0XOYIXK4dvnr/0lMENNrRL6rKn8gxDNRu?=
 =?us-ascii?Q?BrKZ3O/DwWQoIV9KhqrWGrOAro5BbspVE5O4cAP6irESS8QYOkBDiX+3s9uY?=
 =?us-ascii?Q?ubI0r7i+FjEbkoYCkX6DNeZR5C3yHhmvcE48h5H2/la8Jetsdcxu7KzqqyMx?=
 =?us-ascii?Q?fNXhnKJWuAT6UtcCiJEz052+7UK7WqrJQ3h6Vxd9/nUuIPMFZhtXx7gMSIvQ?=
 =?us-ascii?Q?p8RfgwiOqjH90nkp2/ClJgNWpq0fUNHHW9aBfty4+gf4aVyvvIqQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c96695f-d66b-4a22-6cb5-08df4a615bf9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:30:12.6121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCEgE9UUjVIenIDHpW0mgziWT60Yd1oE2ReCC4XOYgt8Cna0U/ogm5EcsgJJZ6nUVI+wEWVS0NLpNXOHC7a7pPrHcquenywF58AJCeIFkng/IfWHACfURfxSzf2JHqrj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8430

On Mon, Nov 23, 2026 at 03:56:42PM +0100, Andrea della Porta wrote:
> From: Dom Cobley <popcornmix@gmail.com>
>
> Add a control bit to enable a multi-beat burst on a DMA.
> This improves DMA performance and is required for HDMI audio.
>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  drivers/dma/bcm2835-dma.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 118ba2f71dc8..063e1b2aabe3 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -137,6 +137,7 @@ struct bcm2835_desc {
>  #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
>  #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
>  #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
> +#define BCM2835_DMA_GET_BURST_LENGTH(x) (((x) >> 12) & 15)

Use FIELD_GET()

Frank


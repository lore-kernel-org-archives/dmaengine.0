Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899195;
	b=S0GLyskLIyHARjs27sPZP5sNAsDyN/EIg1pMcQ/PH3axkiqjTjWGzwzGmNH8iHiBdIM+
	 mAogrQYqzf8Uxd0rtzin6yKK9ttJmvR+T+umP3psIGMdMScVxkgoO7Uys/VJYjYsyEU6W
	 A3/oLzivO/c1C+xaHV7l/RWsLkqP6orABFB7b3Ys6dQMJq9QGZgC3Wy3gV+uW2F8C1I2C
	 KIFksM1rUjWYgO6HFQCGbcvm5A+n6VK5BRgT7LZrtIm5b+SmidoIBRLlTtVVhGCnhtT59
	 Mu8ITaeLlL/mTgJ2UC+y6ctkab5lPcWxrG4LVPvOsRuQXhJPYTf5GmcGbYJiftccDVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899195;
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
	bh=bsgtLT4qGaiELZIU8dg3Pp5oi0hA4tZiF4uTdG/i7Tk=;
	b=ntf0RBB7K769mAFJARph3i69vxURrRo8+AqomurKBYVjHxBDvKQfX7wOyKXkgd2LKpDM
	 Ycz0YPTTqkKLkTatJgMdrsmdmkeklBgtJ8u9PtZ9rDQBo1e5QqC3f1H41uXA/oywR2mCI
	 hgdCv0l4wpNsmtd+61gfsOxPsQ7bubZquX3ljV/J2UXmEywbuG210/k8s9jrgddNfHhAn
	 /g29UAw79qAD3opSoMD087XgE3wfyzO+CYeGBgL33+5gKdAYfrEZMjHIyjw7tx12Zyc3l
	 GqRE9DxfHd6GiJ1MkJUIcNTQpjxZ/XD8zsnnqs1kaba5JwSFhP9Kc6CIGATNGKvcr0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ksobvdpq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.66
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBC36082BC9;
	Thu,  5 Nov 2026 17:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECBC36082BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ksobvdpq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKH/uHQp15zwfhhOAmIIyNCU7aqKXY9v2sJSqql49ir8gvHFXVwauhlbRSuVjuYabySOvlEH7FSU1ezAUgg2xN28MFCqVTECk6PwKtpVCmAwzW3AYYykQJ78pmRlJLfETQmG+qfiYRNn402Hp+u+N7Qbf5Wel7N1wzLMRlfjAVJmxk0H1c0jNoIRPda3ZI3H2gP9iZOO63C8r1HHA54erooRLVCSa/liBZVODTG9OdvLg1HaBbKoesX54V1b/oBzQOBKSrsPSI1jod4iNdalvRSxzRz5VeKYNOPu+Vv245t5oGM3VPobaw+tan9oZzwxWRGuFts5PAZEyg0rQWeAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsgtLT4qGaiELZIU8dg3Pp5oi0hA4tZiF4uTdG/i7Tk=;
 b=No8QpsObDwGjugzo2qh/OCGRBqk676VGSiA6gR6ClubrhtWMLIjqe6pgAxaWERggtbXvCnIKHwo4jeEKw7u0XijKMOKoQwOtZskoG2zP+EJ9UL2LazaDybs6qavWKsszBEgFagmH61JR01AQtmtrQb91DTZ2cgSVnRS0AJVDBmio4YTIksMxWp9dTkiAzv3gjYkUU1C7G7hFPByNPSFs0nuQwDFvSdjzFliJZ+2zqFi54Z76Ca480TEICGXglBDnQ47K29Flb2KJHE8wTjRpCek5P7n5Qzz/in4rTxuGKMWp1prnsyg8tKS1VmrTk+SA9td4AZaoji6o2cHhate6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsgtLT4qGaiELZIU8dg3Pp5oi0hA4tZiF4uTdG/i7Tk=;
 b=ksobvdpqhjUlBjGqEra787zXrCvLhyRWr8z5Kv0leeD7c6y3yVUO5VGLX6Qgz7aOotaThfcreA5ExaNcuDLFu1UA4mbxq1jbHPeQg0cREXYousNGQ0KlmgcF8ynSqk7TuY4kwCc7VBukdkEIZGBPN0PveUAlMfmBQsC69wkmzBCYItLIe5KdSA0KZvltL3TaQM6+FFb2bi7vJGwYzXM6QBVNTAL1ZZYMA/a8vQ8+UxZsJdcHck9oWi/+19gaIj2T5PB69qHcruiioDgqLW1QztrFidEoLmNeL+NEYiT/6QKNxKQ9+qKX6RvDotV/lRxnnROivoZpRdVer7oNDl1EvQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB11983.eurprd04.prod.outlook.com (2603:10a6:10:61d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:19:51 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:19:51 +0000
Date: Thu, 5 Nov 2026 11:19:41 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Sergey Matsievskiy <matsievskiysv@gmail.com>
Cc: dmaengine@vger.kernel.org, lars@metafoo.de, vkoul@kernel.org,
	Frank.Li@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: axi-dmac: add reset deassert logic
Message-ID: <auy6rdWmOnxahhB7@SMW015318>
References: <20261105134040.315317-1-s.matsievskiy@yadro.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105134040.315317-1-s.matsievskiy@yadro.com>
X-ClientProxiedBy: PH7PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:510:323::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB11983:EE_
X-MS-Office365-Filtering-Correlation-Id: 91882d7a-edb1-4fac-3745-08df3b610032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|19092799006|11063799006|56012099006|261026121527099003|261022105027099003|261009223027099003|261021135927099003|261026140227099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2/DCBv0BCOTDh9lE23feOgx7hTFJMxnqw7YHO8mbVxICyAlMBOB649UMSCFrYs8APi0ayki9uskPfB6ECBtoGvNcpfanrkqyp8qODmN5447JhGWzm5HaTFgKuoMir8NCPyz8pzht459U0ZpQt3JNaBMc5Vn13Fs6j04cMppwiE+5JSm+lH+1h0I42E/1G3r94xwcK4ZCA13xnQWxNVZJ66NvnvwzbSIDmucD1D0huixdkFfFopaPFHwoqlpZGIgXNXACZyHf1th1uciyxUkf39iOIvb7+m/2CrtkiMPVmOkrO4oo4ZcV29keg9F+3ZTU8JLIPJi7YKmgqKIeHausm91p6ta5l3HkneNPqDAdQMQsibvS9v/2ptp1EbbojbK3G+VwsZAyNTxHNiCKcp9vftD+oDc6qGmSQO8CLLKyUWiO0jTU8/P22wFojQnQXzWRc/JKVEW1SotriYb22IdEF4p9o+IOrWygdnOXE2FZSKr2UKGqrv5vCkBKOL96gZs8wYVT4uCZAcE6hay/s+5fxUivFsfV4GG9iklvYCbGPxZb2FPtEM/yT04Z/id/6xnITaa9AB1b7HQhObkLc61skEpuuyYEEn0/1+p/89tJzTGmvk9MbTHnCNlVbloryJr7cUaNhsMy8Wa9hzIv3h43ZVpM0UXWZCskT5g81jNASXU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(19092799006)(11063799006)(56012099006)(261026121527099003)(261022105027099003)(261009223027099003)(261021135927099003)(261026140227099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YWyzzu7LDM7SWaaiapZgwhe9NKvH9VFj8Ao6MggkCTxxnUEyX+rEmSiTJjA3?=
 =?us-ascii?Q?Mbl2qJvfzpo0aeao6X+kwA66SBwftSovrw4ItzLtyNp4eNgoclLu3I38ybnF?=
 =?us-ascii?Q?jqMUCARpX44ssPxF0zcomTeEpJ9FSgPWNVQRKlAOd1G9BnwNGe2p0OzKfXnR?=
 =?us-ascii?Q?Ln0Us9viAelD/dzBLnd9vI0z1DR6YcsmPBIzS330ac62sCuUftxtYOjvXn/6?=
 =?us-ascii?Q?HbM/VKmulASs3FgSS6fNVfIMqkiTz4BEYxdLbMjlxKSLWvkH00LxiKhiWOHJ?=
 =?us-ascii?Q?o+cvOUmZpjq+sRfpH8D+tC37QIpen8Bkh5M00GpkF3dEx3pqZbDlCKPREECd?=
 =?us-ascii?Q?BDdwhR3+WpcrnFn9BXVGofb4JJg89EyU8fvK5r5o05U+LvsvTw89LFYmG3JV?=
 =?us-ascii?Q?0wvwW9YyRjIW4gSa9TuqDooBAB6Jjjh3xWq+tfuKlSoLy6x1x1ZpVCz4N5Dd?=
 =?us-ascii?Q?EPFtXnxOwi3bXtYYO68hzsRFh4v6S+TCWiq9jo0b24cwyMTz4TyR5dlZexVU?=
 =?us-ascii?Q?4CPiX2sk2aEvAxHKuw9+iH2vcSycN3b+4IU/sGFogmPUxiMi5q+uxmx/Jryf?=
 =?us-ascii?Q?ZSlUbDYEtMWpA1bZs7rr8DPJUsbiDZsi/1nKhNK+dqbtcOU6KdG0z9alW4i4?=
 =?us-ascii?Q?SthkxFvjhWVZSkCs8JKHj/L5PRb1lZEpnF2XFzUZ4thaFiXMtWwPRwxxXuWr?=
 =?us-ascii?Q?zdaZFQc/9cICJPBrOyl5z5V1ijALfQMn8Jxqw9xOV4hmGQhnkiN/YSTUOVzH?=
 =?us-ascii?Q?+24FxGAOHAgYiGLaNsLwG4KjtEyrU+ysVlvbdC8wautp4bSbr45QoED01fqD?=
 =?us-ascii?Q?Kpgf6hduYQFAX5wkU4jMLDY3nSkTYjg0g0OFAOMx4R9b+Lq4vO4gR3FNj2Ec?=
 =?us-ascii?Q?eQUtkXQQIuktfezn3Ip6quJ9idvHpGtXHjSd/cyx847KOzyMpIICFWw+n3v3?=
 =?us-ascii?Q?ro+6380X1nIB5dYxZp+N8DPJwezbh0QWk+AJYpvPJkV/cfa2fArq+0Cu6WJa?=
 =?us-ascii?Q?iFEQkvUb7QUToEE2vqsrmt6OyNfhhE9BIXcYmnnPtMmM4J1hQTm/SdlBFL89?=
 =?us-ascii?Q?MyXTIUCzGWmAjj+xD/nV7/Ad2kQ/eTiRXogw+fXL9lnlsGglrqtOSQ5XvzAp?=
 =?us-ascii?Q?JdSfohquAYPASra6doM0gS/aiaydZVisTgZys4+WzfQke179AmwkM6TAO3ZM?=
 =?us-ascii?Q?qVz/y2V+f61Y1eMGfVDlL3GLCdmrvQdRT271NC191zxi97PcN4MeQXE9k+I3?=
 =?us-ascii?Q?4K++vOVymXEJlr/R4f7ZTbntLYe+88gdqCwgMa/+O+arraKZ3J4ViNxRPVrG?=
 =?us-ascii?Q?7FBoTF3jYLrA7AknkldgRRlNANwZetzZhDglGajYL4rf4YtgRlJJnfaEKfHK?=
 =?us-ascii?Q?B8F2IAiIvD+9uQDXIpKypafwu7PDGBVVAFlUsqj4M2MQJuxq7JxLGkbnWUJr?=
 =?us-ascii?Q?faXFdpqSPcPPs9V6GSZYawVdCRaMAwmqRTpIun4BgiN3k8ygDot364+rbdMc?=
 =?us-ascii?Q?HgxGV+xyJ6ZC7Jd0Ye+xBR8t3H99uZFV3iClPTSRYaXLp0Bgh88cgeX2ZjQX?=
 =?us-ascii?Q?uywxOZNmFy2A5aL6xBHe0D4vZd6CXX3jM6NuoS8X79lRRAv/6mRcVAMJALl+?=
 =?us-ascii?Q?UQep4+JxBkBvqgGX6RLTMveVDQT/JTABroc8YPPBvx6u5u2OoS52MInsCW/G?=
 =?us-ascii?Q?pRLrWv0Lc7DelBo7Feh6zmYuedCQ34iCPHuHBn/FeXG4oNXHj1WuECCIkZ3v?=
 =?us-ascii?Q?pZtTCHnC1KO7LJGGZR3+v84ZGOlM58+U0kMcEGd0cs/slXUNmOri?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91882d7a-edb1-4fac-3745-08df3b610032
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:19:51.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRLzEV7dokPFJaIPQVjFaGM+PbORs7FkwMl28isxagc+SecR41+p4t2bLEQewsseV3pNbWYHKL3EXdvxeEGeej2fW/6ASYtEGNRF/zR3XsS3jtxAwY7i6hWAJZbnnNgE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11983

On Thu, Nov 05, 2026 at 04:40:40PM +0300, Sergey Matsievskiy wrote:
> [You don't often get email from matsievskiysv@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Sergey Matsievskiy <matsievskiysv@gmail.com>
>
> Add optional shared reset deassert logic, sometimes required for
> communication with the device.

" sometimes required for ..." is it correct? most likely some SoC require
a addtional reset for this dma controller.

Frank


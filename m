Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.162.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793820984;
	b=KtNkynP6D6GCb+TkpoUQfOgwMMkMHdGGWHFbe1J0HKjZiLZLiFSeZleBp8/h9yGepyKq
	 /5sCgE6lN78/QywR0uH8EdDydh9IdIBrUdadYqW0+cbk4jJKrQBTMT3eQtxYLRbbXy3Zv
	 m8eBHAth72YpuIOXbvoQFQp0/VELevE+I8yYRHS3wX8WBeU1TB8ZCoI3GIHSLQJhls795
	 hz/pxcudFBXkeNPU4scrHxgdHwErk3s6a8/I5D1h48UDh1PBXet1g4dNwXgMsOMC1wDKL
	 TH9TtkGSyBRhkdCPWLo0GlIMD4hcm0NrXMG4yUMCCUKmTK8IPrhhkVJgDsGKfboYk7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820984;
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
	bh=ubfkHn0YXW2exRdplPR4KBvD1LppQZqDj6AU6QN3ECE=;
	b=mG++/M1M5LuxzoUKxKc8NqO1a58Cs51ianaQY/jme64Yuupx9hck73PslHewpCRAJ9Oo
	 PqvK+YtYbUiB+W5qHjbYIcDubvoVCg/3JtkUaEtnYknRQ6XgYaSToYDvtUVptS3Hfc9gG
	 FcDLDO7jGdObldAmhM5EH3GUVzvI9IGKs+ARf++78ylQOjVIpcxlMwHwieu0VUU/mTu4R
	 ZyoY9fRBpcZOq6P3gUEFk09nFqWtt4bcvmm0UuLZSP0sGrQp/YKqBeg0Vdr4/rq7+DbHb
	 ld/B2iJ9S8fl3LPgULGQ40X2jP76BEaVLHhsM+/zbr0KjSM/nfNj4whyVDl7AyBk+8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vzYrA+5j;
	arc=fail smtp.remote-ip=40.107.162.51
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27DE607CCB6;
	Wed,  4 Nov 2026 19:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B27DE607CCB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vzYrA+5j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9PIxoqi9ljjpOXxTnE0h4UZOaw24m/me0oOB8M9/2Y7erDwM6eIvKrR8BQ57M7+y2uAvpkrYpt7qx68VuiMoNbV9q9SiGGx8UZLuJOf27z8juNSaPNQVIJpeXuQCKsJX93I1p6t0ucwpumqV9xymu4doPukozhCVFoiesf6+urdBCuMlXSeMPLprotIeDuNpIh5TRlL9AuAzQQjuVnzPB61xQLVi75QNUEpIG54MYNINYbxKhGMoDwMMMRcDoYf4rdk/5zsbq59aHQcWXVH3CjUE/9HYrXl8iAox5fRRTVyrIpgubGep3a2SErn6v8ZdKPjmYcXbMCaMj1/98n1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubfkHn0YXW2exRdplPR4KBvD1LppQZqDj6AU6QN3ECE=;
 b=RBOLVKIj9xBg68jsTCct/pH2I2tjj2rONv1NBm7xL7TAm4cX1y5Ou2eH4CiT1B0818SeOrAEhJdkd8CZOG0a00ddtrhDIkhgr9X2+i6kee0P5vEX0m8peNVj5+T+9MH3ME1r1p5D1FJGm5HlKXdxBLX7UhWMUaflCE/XthFczhKpwtLx4ZNaZIM3iJqf2/umW3BSZtOsJe5ECzRDVJjUNWmlvgBXZz/aLk9jYf12rbEoUoneR4/6rTwNuTY/W8RXtDnnwiIig+1EeR7/IsYGSxv5r9hmp5JqjoJv/QBT0tgMq4g3LwT2z+P4evHxemOiKHR+sDFt25bNh5KBSMXBCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubfkHn0YXW2exRdplPR4KBvD1LppQZqDj6AU6QN3ECE=;
 b=vzYrA+5jtKyjs73I/nVvD8rvg1fWVLJa56hUI28t0EsYjZeFNYQ7O4WDkzx+gMO1/YeGf+4PPl3RwIHBj0ffkFnHHtZFIcvYvok32pSXR+C2Ch52E1M1KQ6G2FfYynWTzzdPd1U8v03l1kFNTOvMU7bCmvr4lgDsEzFvlX2lsDmCoLigD9IpZesYHSdiPY23jVPXQNsrSbvdIItxHH0LIktCzmZmzgbd3z0mQo9/My9zBf+eTcQp1VewgyIqizO8YQb54cOiox/wTcgivGux+VGNbOejjJnMuP9ayk/EPTAytY2AISAfwJ23bpE38vmJI0NPQKjmpKHhrF8WlNsbtQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB12014.eurprd04.prod.outlook.com (2603:10a6:150:2be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 19:36:18 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 19:36:18 +0000
Date: Wed, 4 Nov 2026 13:36:11 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jelly Jia <Jelly.Jia@cixtech.com>, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v5 2/5] dmaengine: arm-dma350: Add slave and cyclic
 transfer support
Message-ID: <auuJKyC91CrYUAY1@SMW015318>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
 <20261104124411.296640-3-Jelly.Jia@cixtech.com>
 <sashiko-outbox-197326@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-197326@kernel.org>
X-ClientProxiedBy: DSSP221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:3d5::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB12014:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ada4088-d50d-4a63-5b90-08df3aaae5a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|261028144727099003|261026140227099003|11063799006|4143699003|261022105027099003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	w/B6qQBF4l0qJ4hcL4c0F3yG4qJqOmKI98tVTqcVClymez3VeMN79VGIgmr9R33NirOfwh3k+e7aQQioMrmOgSjPOEMI2uE5UbjYaMFW2WKAlYWstEa8K4g3OUclRdLw3R0I1KX9K0InDrJ64e0A232PVbDmHCYjbZIfzajB5bUqYPHcBBkhUlwtoX8yi8VhCRFG8FU/tcrlo8DMLNeAGYW6EhLy1d5IzadujDuawzSoEZIOAin0+3ztsW9M7RZRN4QfPdM6FMEykdAXN6iSWGkqx19zo+YRE3VcLfVgdMiimjuPuXwlSy2jgSxXDRlIDLdzZ+m0LpP9D+4jCfLmTFsdkcD1AbbR+e+TdMORp+Yv7V2P2UBmc1ts038/s7VAW6JDemWc9cMKu5xbMB1dQ2zFbjVg4pkYDFSP5T/PylSOjSIKVEJfJgo60SKgJviv5KFFim7YrAC3nyBOVbAJ4lH4ioun24YQc5bpfrqhLgsAOstCyjoLyYPVcQQRH6GcdRXRS0m9L37BQDI9zi5DGGkRHDAQzkLJ0e3hk8xl+2PTQX6ZqIZH6+HxcBNdcFlZ8pDp6rpOgnyzfs5aVfPHBUgyPjT2eH3NlJlVHtC1CVdC3OPxDLAIvFW/jlk+ti9zYKHX2hC6+O/z3odbABXB1l5LTHlmW7Ym0sUJoruiA44=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(261028144727099003)(261026140227099003)(11063799006)(4143699003)(261022105027099003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+kadsNobYXE+K2+d9FUsWFOkPJ104vBDoz71NAdb2ZZGxOfYLUaU0vBJ9zZA?=
 =?us-ascii?Q?a1pwamY0X2PEUqPkeZZWNGkBX9qVNLGTG62GgtbQckb3W8xiZ4S1gyPTk4Pm?=
 =?us-ascii?Q?awmOrJrkMzxNtTOuobsczjR0RymEhYxaDI1bGVTH5tc6sxZFM+ljKEQudpkE?=
 =?us-ascii?Q?ZbLbSAZ0918duwcm2iNLDTJ/pQ6foTeJCnycfsbwqcroutU8vtNFE2sI3HX4?=
 =?us-ascii?Q?CDteDHSV8Peep7bTsNQA7/pUy8D6OK43l8zko1ykthBOvNmeqfHU1IaRlvJE?=
 =?us-ascii?Q?JEpt0cuKFi1hJWB+GqoB+tTCZ9p0gSzQv4FRVAusPr7j14rHL6zddJ1fCS4b?=
 =?us-ascii?Q?2xzrGIedkBfLn4wnMC9KSpxhHJhtBjKsGMOGwkMrvO0OxOq6e3drQ6S+5iPm?=
 =?us-ascii?Q?ySmU6ixg2/xM0YAhn3WSLZPag0q/DTkqO4BQ+S+zOxv2aAF5F8DrbjgceymU?=
 =?us-ascii?Q?AXwunjMHOncNHJ+0B/4LbW7sUI+LDXQAnoCTdo+qTn+zieJEnCQ8dIXsyiy/?=
 =?us-ascii?Q?P6k1QUDFZNfnUF7NZo0KcMXFHkXBoC2AtiOj+uh/IjYmbpxeAmSq4A0nLuqF?=
 =?us-ascii?Q?q+hFpSK6f40EU3XNkiJWgzI1kYp+ECXEa/xDhhKMpbw9qWOs9zENoUVd+NhR?=
 =?us-ascii?Q?V1EcRsXIgEbc0qJlAd8LC+i5ABb75hexMGhoQgW9nJezXoth7s7JfMeZc4QR?=
 =?us-ascii?Q?I8HM/62zqN1u6CUqyUzVkBXl7TNSdhRjWq9WeBliazgYoiXTvDaAEmZVkJS0?=
 =?us-ascii?Q?iMJiNLJNE+ZKCaA7q5m09ohpPu6odLMtskK4APxjq9trSMY6IGd85GzqVLmQ?=
 =?us-ascii?Q?FF5wy2RmWBMxjX8Yq3KE4sJ5usVO3hIF0oKvNVotyvM8dFxtfaz8trk6Tmb/?=
 =?us-ascii?Q?nVMnbFTXoeUA/1Yj5ljGYZ26DahtXRE3AnZ1vcsTdu7SKwA8k7ey0yrsZZXv?=
 =?us-ascii?Q?Wo41FL6xY9JhfTSuVtFhJzDy0VvrRm6tC6Hrh16+CCRhSsNrPJ3/IqcvLFhE?=
 =?us-ascii?Q?9spEsVbL3WKHGZ1VsqxDpjkZYvq5KWjUTP9r2MbywYoCdrd58slB23+qZJR8?=
 =?us-ascii?Q?nTcjZDgQWF8ouP5q5SNdXzabFm0kxUTCUAbBY3gk2fNOwrFUIAYP3fzNbVUx?=
 =?us-ascii?Q?rgTR1dQ8flqB2k0elvzxk0UbdHVn/gbWVdBT6qmo7sPSiP6BZAHp7Po1Uw1L?=
 =?us-ascii?Q?vQ4yZbl02hDNj7OaAXZpJv+EYSBmZc17+e3bu4m/ffvvi21E3wB2ZJf9/xBt?=
 =?us-ascii?Q?xKVxyJjjY1FzS9Cd4Zzyp4R5L6NcGFTynMhq6uCEp00IM1zkKJOv++m2k/3G?=
 =?us-ascii?Q?vO6kE1AO7xSNNbhCFO7rZ+dDZW8VCqAY5xj6HxaJzH5tIZdPE1pBvUbvcTtp?=
 =?us-ascii?Q?R/KBs05GafFWVTYSa5kJcIgHioTqQKIvQNOm6oJfVKotgLvlfJPaQlz9AMfJ?=
 =?us-ascii?Q?egGDpCg7pmDe82VJHVwmurtUSp2e6KhX974bFBa3/5Ja4VBA0xk9FJ1zlaes?=
 =?us-ascii?Q?GmVPFAez9hc33P97NEvAhyFf6kOx/nr4PCqX2vMN0+upRpU2RtQqOc0MZ3bW?=
 =?us-ascii?Q?4pcLEB+YYW/Er5+ml3On4V/ZOuHgLEyzRE+uUjrXdpDP5G3mFS4+wNecs74l?=
 =?us-ascii?Q?xvs2rj73F8OxvYerxgS32TvzJ7WfDAcQlSe0Y8JVShCN5FrDyuLOp9YzdLKq?=
 =?us-ascii?Q?HFAAsuPkYKttRMZQyZIbwqxBtdCeHNQ7N3z4pI9Z9Qu/TzAEzi+kAvgQgDsx?=
 =?us-ascii?Q?INszzjdA0a2JAkpz0bmLRZwxw+xeJhYq37ZH8DMi7LgEFAU1TXKt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ada4088-d50d-4a63-5b90-08df3aaae5a2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:36:18.1978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYRuWOESmI3zOidKD3hDgFHdNItXqpABYTAdzYhlSf+3VH3QID9wDLyl+yfWyBdyRhLityXyvM0Xn8UIOyj9uRrNLfRYnl5slec/bho9N1ocWWzip9ErTaBiodDA88l9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12014

On Wed, Nov 04, 2026 at 01:08:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] dmaengine: arm-dma350: uninitialized sentinel and reset for dch->req
> - [Medium] dmaengine: arm-dma350: clearing dch->desc on error in d350_irq() loses error
> --

Please check both issues.

Frank

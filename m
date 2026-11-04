Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793815122;
	b=o6kN+LQV7lc7Lize3s5JKvB6UgikcevjKap6hEOybhbWkNVF6s7VI1DDESnUBmuXEvlt
	 w+ftP2o0QfH3F/s+nqF9Pa8HYHb6Kq0Yuh+fZTtSfFQL9SEoz9DisAMY5A7d5qowkAnF4
	 71YeeDRjMLIK1J9cTaKPyiTq+thwWWnrSWWYsNGo6WVkB0nvNXSMdXbMhegSMZtuBu8dY
	 FZLB5pF5fszc8C7xm+YqLrrF9L2cPNXGQPgkZjcJFRDZf5aK3wIZ71dOkSFSkzOcl0cdU
	 w5AuE9/4kq+HtfSuqvlrDhDdm833ISOq5nflSxEjC7GL1QgbYgUvWUsZ5fA1DmIxdBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815122;
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
	bh=sX+sti+EHcfr5+uOEZk1PJWXMhtb0VfQNR0nEsa5AmE=;
	b=C43V3EgftxOzCrnfOSdmW9Rf7w8kR3DxpW5tguaBYB7+eE/hJjYJg12wSHQT3BIfNmed
	 EWw6c28nDvuMDW6rvONCVp+0fAf0UTjBgWAHmZzTsplHEOsR1vU7ub2bIs/qcXUx5QOdS
	 0JQFKUrm6mURJ5kUsy1vbPu8stqKgkZUKlxWpL40g01+RQ/CRuE+ay2LHCZqMFtQyErgu
	 ElMstLO6jPYw9XnZ2xB/33BkHqu1eMDTOuOBWNJGzZ8nqa1i48aTIiBHMcmdzzwew05kU
	 q9xoQKcji+400hfieKe122IyIMOAqF3c4gkOkIVpqIBes5ZkNs1bkpZ4wMgcNKW5cyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=F2omaTIl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.11
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C288606A339;
	Wed,  4 Nov 2026 17:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C288606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=F2omaTIl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IR4NRf6uzADb/PRQqMlPnUZ+TqhS7TCXKNFtPiVJ7sNPTLbq5RysLNN6KGvmxh24wl2CuGVmlDecDZ3pjEHbuZp1Gvn2ruS947pRgIzahTeFJ3eT8uaaPXpH/5zShILmCDWSzcQnBLX5DlBSNwCptwCUOyOjyf34LWPfer6nvLEbUDWT/NFOJldYyG0KXfwZpqNE3TutXOa1GxScOsn0/oyed8fE/NI5B3LGArfTM6yV/j4dRsNv0udKcLR7thiA9yrB/kEdD8lqjbzhq6dq2D6XpT+TJI1JEs4h+eAeMMdsyhnUjuKuA51CPGU3J5Of60dCoi4netyZiH/yqfVccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX+sti+EHcfr5+uOEZk1PJWXMhtb0VfQNR0nEsa5AmE=;
 b=JbWXFwEfLIAwWQatF5w6kNwTkdSQQd77lpO+BEqZ7bTflyzncMbrDrs0UX9Aa4IY3WIb+j7lcgTNKlYgzZ2HAaG4ijHE045+Dq4yDi7w97sui4mwro4X05f5byt2dFmyLJWmixabtcOm+9QckP4xfOtze8PAw+hIf9EonLUEAHC+TMFL014zghR6fnrn5VL4sGyS76r4mhfIKlIQuTiKdiwvTSnWSI8gZBWLtkGsNG5k/DDr0DP6evuxh1Ws72+HONpWHUcrxyJMunOaAJDTsmcvsrbf/Te4nl8J8DqNHLb24QRU3EMzFVmlX/MH36AW45IyK72UWAFaB+/LElYlaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX+sti+EHcfr5+uOEZk1PJWXMhtb0VfQNR0nEsa5AmE=;
 b=F2omaTIlDhpIlq9sM1u4yIFwPvsJR6eYYCu8SinkXLtzSlik7FTeJtmSJ2y+zoKbTMg1FLuxWmpTLIxyt/ZuEy7lRjFnQ0FpYgS5vQB3zjan0HVsVJTmNVFRgFiq5sOAyEOwu4X24ALSJdFQqlo5cZOYrOYqCtoZC0kFTazsZClLwcFQJy0mr39HvjbmBh2n90LEfSYmIogKdO4JtMRZUxKKUiDjnEgfMj8tJXU0AAUmYipn1JlZTtifWXTM0cLwd+bAdhjBKUVErkP4AAeWw1o1pXVFWsaplDczyu6cWvGPjQ9Xh/jshMCZT5pCVJquoefBQiaKrNgmL7NXOwY2RQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 17:58:39 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 17:58:39 +0000
Date: Wed, 4 Nov 2026 11:58:30 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Tony Lindgren <tony@atomide.com>, Daniel Mack <zonque@gmail.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Julien Panis <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>,
	"Francis, Sebin" <sebin.francis@ti.com>
Subject: Re: [PATCH 4/4] dmaengine: ti: cppi41: Share register setup with
 resume
Message-ID: <autyRtcvXqwOQSki@SMW015318>
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com>
 <20261103-v7-3-topic-am335lpm-cppi41-v1-4-d7213446c5f5@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-v7-3-topic-am335lpm-cppi41-v1-4-d7213446c5f5@baylibre.com>
X-ClientProxiedBy: PH8PR15CA0013.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 711a94d8-96aa-4ff8-4c76-08df3a9d415e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|1800799024|366016|23010399003|18002099003|10067099003|22082099003|56012099006|4143699003|11063799006|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	/E+8IiyqF/iSV/jgWc/OD7CRAvibnlMcWRmc2BHdNrsiaB5XauQqtR1deW7OlWfe/QS7E951ztcnEARAxPx+6Cb5q1cIQHh67a7lNYc9fqwsTEe3xGyCUGkAxUkLh4QdE7GYDZAxB7l88mq22a+gk1Xku0vcDNtlPE86RQg7oi3AFb7VmMolvfU9U5suIaS/bAJyXpVwrdcfoHC0etqkOFckPLxjHWHkFS9fiA1L3SwIPlDqKEmecc6mXsTjP62M/I5UlbCLYNYoJCQ3SUi3IIm+hyP4t1+W5RvJmQIiszTEFnIp8OKIeZrzSsp5FXs6JCdB75oKv1VghcKQ1oc/j0WhxcybU5d0DktsajasWCxIWh2sxcQXJGRc0kvagZNvghMtEraKvar22EyVr0sS9v/WOcyEtvGfZJbtyAnsBRpzp0UA9BEWoRZAxQjP6EMO/e2FMLs+i2PmGK6uyrZFG47k4SK99K/8tdGuSZKeQWMu0EMUuoKuizWZG+MMmmsNF/zFjuZA5p1FUWqfAOHe9525VPhumiI+qt19+VFt1s64AKJf3iHFkudcvUQb5eRCaZw6xvUE7IgEKt4MtNjr8NsJi0k3N9SNW/jujOJw8cviW//kwOs/LQosvI8/ulQaTc0R6W8kF0iMk+ZJGT0gB75XkdlWp49ZuUI6r2S0Hng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(1800799024)(366016)(23010399003)(18002099003)(10067099003)(22082099003)(56012099006)(4143699003)(11063799006)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5HdkNTi/4LT6yRC1I6gOjR40TfeS2wD/S8c6Wl0HpdKXEZ9EcBNpPYqsyEqC?=
 =?us-ascii?Q?YORjzJjX7vWfj0tzExv7qeyJUtcObZrJD1s1473Tc6wxAH5Q2mreIjRCXRvr?=
 =?us-ascii?Q?j5Ka6cvMi9LI1A7QxpvsfujpuODAdkKya+xXpB5xcjOZlpsYE0dmkRLnEWIF?=
 =?us-ascii?Q?cxTPK1Yt7k6TphERdsHe7hmw2fYcA1OjMV3Uw2zfUCVk8HSCRiFeb95ROlf0?=
 =?us-ascii?Q?9JpFcX1aJC2pEAdCK8/KA2zMXG3PIOPXuwTyjh3d6B2mQ1KUKmIMyvxzcxkF?=
 =?us-ascii?Q?ycD1kn4ozMstcdu1qRm/xgdIWeHR45LLKUqRhlw9Nr73yzEdyD03lcWc0iqi?=
 =?us-ascii?Q?GHIoTzrq5dYo+BIKRXihhXB+daQt7dnAnV9LT0Qmir1uM6TyyBKt1QEYZyNm?=
 =?us-ascii?Q?13iHj0ycHcujm0dchxVowRUWTK1PWFVeu9uHqJe0ayg+G0EyLuH5uO+Q164b?=
 =?us-ascii?Q?I9VvVZ4wxPvA6wTXjKTT30NglypDzhFnkPWa52smrrtKIdOEc3yb1Iu61gcz?=
 =?us-ascii?Q?buX6D5PwCDAhsna6+t86ZaTyXdnMbkEyqxCD9tM0vDQptOAhSnLHSMtXiiWD?=
 =?us-ascii?Q?Rarzx4uvIUaeXyhYTOZDcHNPwcsBwmgdnkw5MJg/VVh6w1gWrUX45t9ceuPz?=
 =?us-ascii?Q?ugquE58aRgIrcrn2y18QgPZlJJz9khlWwwO9XdxoTCeM2chpJStLsJSrtBny?=
 =?us-ascii?Q?T0GPoQ8EdZjba9HlE7IH6U1FsA1vvSs09632LdWZB5JQ/ez0/7kNyOsNo9BO?=
 =?us-ascii?Q?QEwwhlq0qNBkY/3gw1euSQnRHiGSoy7it/i9Qe9x5iAHOMcDFhWLYBpvIwcx?=
 =?us-ascii?Q?15sgH1FrOAQma4jKkIJHVM1pVYR6+d5MKqXpujt4sR11hNp5il8G5e2w5Gf5?=
 =?us-ascii?Q?IBDgEK9pfr35WY23lmDHfG3R+p/jVujom+6N07087MsZSGG9CUwTmxnRe4Yw?=
 =?us-ascii?Q?3CF61os4y603l9OzenoHldcP4nkPl5HS9RGqeQQqqBCSlQWF9JMdkLiN4Axd?=
 =?us-ascii?Q?LP5R/WlAK0ppjt9gU4Jbg37B7NP00eQKNvuMPxMvGjTPo7Q47dzSiv9/pxfb?=
 =?us-ascii?Q?1rITCEYhvkh9+iK1LXfB+tTkrmjrjZnrYd/JeOnfjVw4J0GXh6vY5ZWIEE4x?=
 =?us-ascii?Q?FhBWt1/9FZa5pTFXUPnCVB1HkTzD7RwElLOWQ9sE7RLiu9t42In1ZjSjOqJk?=
 =?us-ascii?Q?c2IqfghvNkVzs26B19vhiPY9+Duko31LLoSDL715nrMT1Zdg7bEvtpAKi36o?=
 =?us-ascii?Q?wZo0Y5d0v14cYHbn4Qj38YWiIhbLplOKYuSGtFGdhis3SW38rkmINAnT0/kj?=
 =?us-ascii?Q?VRbcpnx3Zjh7UKTjCR2lAqeV/vzVJoVLTdZJ6OZ9GVtCxIhf+Sd/liuXPFtv?=
 =?us-ascii?Q?PcO7J1A5RkGhsSlbNzE0hami6m/W5dvi8FFuk6OUm8/g7U/tTjAYY2oUuJc0?=
 =?us-ascii?Q?wt/fErvt9M2DAGkyoONTAq1j+EWAsEP5YMi6xHEvif8wVlguiZ5YEbjQ96fP?=
 =?us-ascii?Q?mVRVtF0thP+HiF9Fy9EC+xL95/TP9CBR3NP6Zr1RnQyxb/KD/EDJZHdSmbS9?=
 =?us-ascii?Q?PDQqXkceX7PeKV+IywGazM3wPKsPbEkVhvkMHC0XCQ+J6bYD6C/HRvfnVKQ0?=
 =?us-ascii?Q?5QuqmIVXU8o45rveUMBAq+pByf8IxrR1qhnXFXu9p/WzsyESpL+5R9n356Wk?=
 =?us-ascii?Q?Wrki8vmmRaNfWqrAUIXeBKbnRRAdJRmLBSoaU1O+bauNBUJVRdmKfv/6kftY?=
 =?us-ascii?Q?Txe52MqMns5wN8GTi53HdJl57VBKeuUEvOUi51Vaq8ohzgwF9Upm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711a94d8-96aa-4ff8-4c76-08df3a9d415e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:58:39.1523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnVUiM/mhuRISKI0aJh2w2UpJpKKVluNHkfQ1uemmxjAOANbZVN8dk1vGwGMD6+yz0CLcECqes8MFJha3N0gMY3RmWky2rjI/6MUcoyuTdMuwjXL1CCipvOKcDkwGlc+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955

On Tue, Nov 03, 2026 at 08:37:31PM +0100, Markus Schneider-Pargmann (TI) wrote:
> [You don't often get email from msp@baylibre.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Both probe and resume basically do the same thing and setup the
> registers. But resume has its own copy of the register writes. This will
> always lead to differences when changes are made.
>
> Create a separate function that is used by both probe and resume.
> Note that the ordering is slightly different but I didn't see or found
> any issues with the new order while testing.

But no any issues found during testing.

Frank

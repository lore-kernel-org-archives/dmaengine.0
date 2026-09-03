Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223933C553A;
	Thu,  3 Sep 2026 19:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788463810; cv=fail; b=tdH01bUYMTlzA+C6FiH59wFfRmWdQN3IeMipwYlhJqjLwiqDam83CVkadVs9+PLsVlT2twuK3+3CPvV4/uFvtCBJgHFuB5tH+8Jt+IliZYdnDxR5N6jj4lkAPWirRgk3GQwAHvrsrz3msamCURkpiZiHkl9N06EstNL8X8c9FPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788463810; c=relaxed/simple;
	bh=Gt4GmesoNIqptuPxe1R4umqUVBXYbRMh/CQCi839XS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VSdZMYXpTW8HrL4K0jkyNzVetit9fdUVd5KBu891kTaA48euY5zobpBmwS25BGZ20doS9y2C1QfYpWoNY2PVj8D5I9ol3gYJGPuHapmYCUEHk7NAFmDNcu4fAQdot2i5QNOodpp4H0oxIpF9ifpB32wxwjplhp2QaJGqkbVUtuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EQJUXPmE; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EQJUXPmE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhKUPcPqBUzhVmKIE5nf626Mc5bmIvj9f7zwrRz7DoLsuZhFapQLrcyM36A1ER8ftqUZn3q+oec9xLqC7flckYbG0wbivvR37sRz4aVjJhJPkx/flv7f3hQTaJop8Ti/qryv8ggzM7Qr+nPJSmGoxUJabIcYUwR6OeQQ28K7IxXKDpbkskQroFnH5Rjhc51kkjObGMygRkWTsNc+au6bSarc0LcTRZRp2hykHKgT4k0t6XtBePg/dMw/Jd1tqoOaD7idfsCMLtr4pmOdONwp9y0vR7CswCrLPFrTAXrOqUZVJ7evJucqoB76jTILW2LvQxJ+SJxNEyjlt4rd1iHOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJmu15KvMzgkuYwsawWQXLX3Cx9KM9H690Fc085PkDo=;
 b=YroBCQH+2Rq7AkLRtBvVIy/Wz+8MPfW9+FeQjGwhDaGVnbKH731BNjYe32f6vW5JMKQ0YrW/JJ1io6NkLsChrFXJgSd0xyIa5cCstFC7vos5J64XZ5iqjYkAiS3p08Yim65pLelRYTnUhpEEepIIrbouVE0lCaOntamksd13VcsrOg8aPdRcYMtfBIsHeUrh0GsznNwDc4hb1dGhhUUXu/AbxLDb9QYZI9TJIvoALUyodVDr4uDc/ynKRTGNcd2nNulBTDJMC9+Sq7/POF1auL/uOpMnPeSx9WcbipYcHUeuotAltmzw/ZtlsmkaQS0pNKo3OXRGPDHMocguqFGGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJmu15KvMzgkuYwsawWQXLX3Cx9KM9H690Fc085PkDo=;
 b=EQJUXPmEqroK8baxTPSW/lZritH9VTmwpOZJpDL1sqLK7Xh/V2NimGVJ4GrNikQMVuEqMEHubrAjOCl6abHCQ3DzyZw7QH4tYu+PxmLVVy5MjkRUDu2MbQvrNZ3Gbvqbuq+npH/ZotyKAvQ/PIhoBgNvFwycG2BcCONZcKsIV7++kgUf9u8/Lg+2mQwovxBBTdC8g4GHpDXt1vRGLeuSMjPpEkadk//ZJnp0RcUlFaUnDl4F8THvyUXBYIvRb0+1Sz9LNoiRZV20KIznpDucZPf7Rq8Z0YUJh/2YFNNsvJv/dWTmYObdyt0b8O2/rhx6jRkhV50FYlcWM0XyEycS9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12088.eurprd04.prod.outlook.com (2603:10a6:150:300::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 19:29:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:29:54 +0000
Date: Thu, 3 Sep 2026 14:29:45 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/3] dmaengine: Use non-atomic bit ops where safe
Message-ID: <apnKqR6ScF2K3GFo@SMW015318>
References: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
X-ClientProxiedBy: CYZPR12CA0003.namprd12.prod.outlook.com
 (2603:10b6:930:8b::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12088:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd7f0cc-ac2e-40f6-f896-08df09f1bb62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	sGwxQJsmLIlE6xkL4wOcHfSH1wAihodaukCZFQgXT5fAzMxv/GfCepRpykcbx0AxqEfggHpzNFEg2j2YW0ukMYt8SG8sNzYHkbBPRz6HL+rq8AN329nE07LdfkiOBtBdAnRu23kbX8rHCN7HmAd0cZDPPiA/Yr9dkau80zA3NBYwYTbo+WwmJlGGGoHs2DOUAEq1+83zaGVH/I5vT2+kDkLR3NDyyY1WcR+tpgaIn3TVkXDeGxFD7r7hWGjAaAWRtCvpUR6PNs73S7XC+ktgzn0zinLnOKu3RgxczZkvmX1OABciinWVMDdI0XB66jyvCb62jNyTj6m64+dynwcirMf3C3J+qQx6mQm9aj1DQ/6+6jwhUNtko9HSuDcctJyymNsMwvb4vN0kuDXsN+3s4ZRkUWFXoGT6wMDhBAgvWWyvMqB5pJt+/CQtF1LPWcUxob4HPHhQojmIVk4QXA7qc9zp/9G5OCaSUwCND1CqfDM4GVbb6PQdzVVLNS9DgljqwVq3PsLHIcwsYkTU5ZLqcnE/2aijCgJvWAhFdSnJ3cxNZm3Gnddty6LWkFQXEaceUApazaD9b3rePGgEynX7mNnKT1OHxDK2RTInBSvgmiKiVY6WuqWTZLkyIc3v1xXRczGrxCAEqTKGyM67j1+9I+UJ2TEzuQHyrflxDVPEqxs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JQ+/2d1PkXSpp4vo+9ggwr7Ie8oITdwzm4B02S5SWA1AfKckLz5+7xXVyrsi?=
 =?us-ascii?Q?eHVqFJ90Cz5EQXr77U/1g6CpvO0WRWC1lfiEMRyuSMGKIHx8MsXVacMTqQ0H?=
 =?us-ascii?Q?3nEwAZhlHYCmK0E7JtZMUPMI7wZFmkfCOGBMYrVqscTyZz495K8Ngnpq4MwX?=
 =?us-ascii?Q?7lGyzxMP+yZNffPNrv9aAVLmoU0McfKGg8i6FTRf0sTlxjcVc2XavHgQmWwp?=
 =?us-ascii?Q?k4rvsLjLQu0n0lk3hJ/8GQ7tV4lXuzjSnGpkrX9Nmwr7xMlQ6ofSHaIKQXjo?=
 =?us-ascii?Q?jpA2LUHaZnL0yp2eZLGnE6KMm+i3+gAQ0ByPkPAKZRSQpDaVgS96z3Zt1mCR?=
 =?us-ascii?Q?prMyT4JVndZ/0ZjRhMeLnJjYIvhQZEfL9i68s7pAo+AX7GifGGhTfWMsJv3+?=
 =?us-ascii?Q?TGZtDqV5gtd1lwf/+4XbWSn9zVFLQYum5trFS4unZXl2g+iGIP7+9xvGPFpC?=
 =?us-ascii?Q?5Ki2wthXCQxo+hNvDGICOoXCzg0MGQ0NYfsXxeuEPw3QF9+7Ovha2d2p5nEa?=
 =?us-ascii?Q?RAYMALv2jiJkb+O08weTGPpGM6e9qnHTPypm++vUvopU0ouv7jZFIZA7VyUi?=
 =?us-ascii?Q?KucRy/9jpcVzXsbw9QYnKIifOS5ahsQMjZ8fb6RhoP8Yv30vcnEyVd6a6201?=
 =?us-ascii?Q?T8Ug9v4yMvCx7ZpOd4Hvrl11TeJYqFNL8e+EHbi00oFTjrjS53yfBmiQKmw8?=
 =?us-ascii?Q?z8VI1lCyp8z4DCXBGWXAyCdYzAenBUK9q7nCUP13OD8RpmTlQDwNIaPWIoUx?=
 =?us-ascii?Q?NShx/rnNwbdI+H2m5GoGw7RPovENygnMiQ8orEuapNi9LoCu/qAAzThqALN1?=
 =?us-ascii?Q?G1+J9rW3rtf1Tj9byMNuoPabiAddwj/ceohMG6F5bqw1T3MM4WWqTDCI/QnS?=
 =?us-ascii?Q?oGfZJ0wsB08Nb1eE8am0u/ppBeLD6huT/9q5NL3m7/YcI8S2dPpImAhMi8CT?=
 =?us-ascii?Q?qkVxDSsO/QQ0oxcQzHHL55WnsRAuMhGm4tjL7sBFhTDEssUWwkR41PYIV0pf?=
 =?us-ascii?Q?QMrWQuFl54K4J4haU3CStUp2n/XdVCvdjVZXuImRHT8XXXGBxoxOP6/8K8ew?=
 =?us-ascii?Q?YpedcjaYcWpszxGs/ytFjtyoEx3gYh7+uhbPkI5+VHDqzNKD1djilQ07bVDG?=
 =?us-ascii?Q?gr2Se2uGGbVKBsWQitbVvVj01RRlboj+7vjhWrr0VOzK23CjV6lTaBEC58b1?=
 =?us-ascii?Q?cRHWcTYCWoU1o4T+M42LYGJnjjiBEWdzyIrJAEUGlARJ8AveYi5VtnV/ccXi?=
 =?us-ascii?Q?8+TNZiAPcbYPmtkiE+QXnYvJqvx0F/M5tvqUgPNk0HEAl6RRdVm58t6WcgxV?=
 =?us-ascii?Q?F7TWNpJSNtKMEt4ivYA9jr8zjYcZJMAe/wwA/bEJWlzEMfyIzsCmFyTRO11V?=
 =?us-ascii?Q?nDA+KBC1cxjOcRIhiELofn21WDkn86T3SmOWLxTeVIGZLITrqWZMZXn7TmE3?=
 =?us-ascii?Q?LBh17Qwrd8uHg2QqlDqZnHmnBgJJcAK18l16R3p3o/quvtg0Ty9dDsQfAYGY?=
 =?us-ascii?Q?bVnhU0P4eg8OEzdQXR+iRxN21tGInq7qmXBCN+Au2HjXI9tqP2NcmhXRF+6K?=
 =?us-ascii?Q?VKQ5CgW/II9wduAAecSHVS+2jBgMUwwvWI0uypMf+nunV+K20jTRjwO9bHge?=
 =?us-ascii?Q?z9u61atjAGzqk955M41WgKiVvSHrHvon73ksiN29IWmw3PIo/Qa7vfvRYKwe?=
 =?us-ascii?Q?Id7f+9PrQcOxWVTIwcdFf4g1Q6ZajU8D8Pk41MI+Ad1Q8V/IiykfhKSHN3e+?=
 =?us-ascii?Q?b4U7K6fgpQlze1rup6ZN0T3Ad8PRLarWCeG1cpHDSa/xWdd9BaTK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd7f0cc-ac2e-40f6-f896-08df09f1bb62
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:29:54.8238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMvEy5ctshACkbmPpvTmTmYqjuca+ArdNm0arj0xh5HjTWZoz5P0i9Y0hU1gRJDp+gpGTZDO4K7zOMvW8xE1Qf4oOEm+0JYKDDy71x07hqc82GFAhwssXChX52fjEJ0g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12088

On Thu, Sep 03, 2026 at 10:16:11PM +0800, Peng Fan (OSS) wrote:
> dma_cap_set()/dma_cap_clear() and imx-sdma event_mask setup use atomic
> set_bit()/clear_bit() in contexts where no concurrent access is
> possible:
>
> - dma_cap_set()/dma_cap_clear() are called exclusively during driver
>   probe, before dma_async_device_register() makes the device visible.
> - imx-sdma event_mask[] is zeroed and configured during channel setup
>   while the channel is disabled.
>
> Switch both to non-atomic __set_bit()/__clear_bit() equivalents.

Any benefit to switch?

Frank

>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (3):
>       dmaengine: Use non-atomic bit ops for cap_mask manipulation
>       dmaengine: imx-sdma: Use non-atomic __set_bit() for event_mask setup
>       dmaengine: imx-sdma: Use __assign_bit() for ownership configuration
>
>  drivers/dma/imx-sdma.c    | 21 +++++----------------
>  include/linux/dmaengine.h |  4 ++--
>  2 files changed, 7 insertions(+), 18 deletions(-)
> ---
> base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
> change-id: 20260903-dma-mask-ddf64d770f7d
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

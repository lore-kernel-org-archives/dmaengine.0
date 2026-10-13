Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6025372C4;
	Tue, 13 Oct 2026 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791927586; cv=fail; b=GYbwnygGyZa208HPkqdgtXE0FQxz5az/mqgrxscr24BHaZ7GBzaay/t2LDwlJvvw7xUU96X8KqHWKv7SyJ0lgLpW9z4ceAhMDQwYvqGYZcwe6TJZc8vaKI8WrlS0mFYlJ9kRJDt7oVk0LvnG5W/0xk22qK4COpcyMQp9AXBL5us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791927586; c=relaxed/simple;
	bh=s43vVX+i5rcfBThLekndgYR8O/K9RqZ+CEXiJzOIHe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aCw6i4YD0XYxB5t3Tvwl6kXlZG5ts0VC7JZ5woUH1UBsMEC8dtXadFPwpkypuoAtMN5d8L8sN1eit0KoWOMpI/AC//npBs4bY51aUwKoiZkubNlWrXmtwKB7ZQUQgGBxbVamedsVcF2DctTCwjo2UDdZu9vGc9Yf6ULWRwLFEmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xHCamnW1; arc=fail smtp.client-ip=52.101.69.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xHCamnW1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mrxkjha1ReXrTmdZSflypYZkLDNpRThTFOdQ9ZnK5iS+Kb7xCZlX0UooThXqfmB1Af8OniaieqyigZMP4LXi9y5/1a7/d/plpli4yHuDbf67JGlFvPdvBXl3jVEXtnbnl4YDo5o4Oz4QzgVGp9vWRL5xarg+brI3ri79MWHnmEoDFc3Xwz1baUy7k87Sx5Inu8FTwpvasEIlQYAa/XAiU5aok7St52qpuTJbGRbhafRU+NUC6RIkMjd2zZf12VjcFJ8yK4zeaKihvWzK9iIdo0TAVGiBeRGTF4Qzm9lc+ebyYwLv5jwVPS+RN/HP5yAT4CF1LKTC28od6Y74EXPICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jA3eLLz4fJhaevueIT3oU3fiKi5rfOr+gZPbjOQKKHk=;
 b=IZVqiafPBZLiZtXhojLwyF4V+mRyzClxgd8Tm9N4cX39lPhTICMvdQfJhR3NLwiNR2BsytS09Nl/XJyBBrFmZIKId+6n7vakw2gbG4ZngEAKP4PUs8NRXXbWw3TddTXDztICCHxkmSBqRdBooRkurX3H2ZrfN5DAd8GRvrUeXoUrJWVSiaigetUbeqs6fuaOweFN8oSGHAb6FG+j1Uf1X9NzzAo5+QZKqtwGdxTRrSC5DRxEL3Y2fIvqtEkMa6akbx5eOBJh7ytQobKz/hLB5Km9s5cKeAisE1OIAWhOuk2GKNJNI3ooBfpQYtpIDGtu/v0IeVZdJfrS2/31/ZtE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jA3eLLz4fJhaevueIT3oU3fiKi5rfOr+gZPbjOQKKHk=;
 b=xHCamnW17ySFcbFhkcig1KcbSOn7vMAFLDErqA5fcfdxMPhyEC+sB9dShBH8jZcnwTLZMyygkHmaqP2zKd4SksBe1fVULCGTRKMO6Gpq5zFkJ40Ph5oV/SPYDdUMYsg3euPWpXjXi6Uhc8TzSdyjVPjeMzKZmHlivJGC1+CWBvtZh71Q9uOUKqo6wsvVUN0igr0Kd6Qkf56wNNDVGN7S82dEICR7hpvKbiGb8kLIraoPRfop9rigCZ+ZnsYpPFXlOtExxOTy5XfoaWe0BODjb7MLJsZGspds3SNPKb2O2CqpoKYVwZPJDzXVGTgzrvZDBnifxd92j98kEGgtDSVyAA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9281.eurprd04.prod.outlook.com (2603:10a6:10:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 21:39:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 21:39:41 +0000
Date: Tue, 13 Oct 2026 17:39:33 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Yi Sun <yi.sun@intel.com>,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH] Documentation: ABI: sysfs-driver-dma-idxd: Fix the
 kernel version 6.20.0
Message-ID: <as6lFUPJBw4rTkfN@lizhi-Precision-Tower-5810>
References: <20260911225737.11411-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911225737.11411-1-kmehltretter@gmail.com>
X-ClientProxiedBy: PH8PR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: f03df01e-01cd-4e7d-6673-08df29727d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	CcpU8kaGdl834ydqDsxvoIJqSIhf604Wn4RrgWhgyuSRp/uXhwQO8h0685PrEi08mYoUBJ6bwxj7twVk35WiKQcLK+x5KsHGrfwzf+aj2FggeJFWa+Tw4u97nPuq8J2wegUGZ8KUGgWNd7B7JeCXfBveIysndYBbiXitMuzzLEn36b/Wnfk/qfW4QWMcp6vyebHpcX5OIdk/Hu6/0tBODBrfp+vrSi/TQXZoWRBguRpRmRdZ9tDE3piU62bSV6wOrHFnYTfuFpP81jmEpR0hcpQ6KxnoJfWMYnFu3a4Zd0WBiRAaa4b+YMYdUbms4fZqaONUDvxntAvQIVgjhPHjo7FRhFslzA5m5Z5oOrJo1NpEayI298C2t2QwRKvP00dcChVJ8dPMAAzAQl4IwrltxI6mXtecSfMPguxaQOaiEQKirUvc6WdCoKOhCaDbSKYeoToN8pGhWczXz5L7ChkMqvPcZW1tSqriyW9JF3DIwtYPOUQ/2xsOjjQ4PVtSe3MfuT+aSQnWAUaLylaVwvMMqBB4t4x/9n1drrdwm1d0jIPhSJLJMrBcajCQtkRF6qGtcMhnt2ix7/RRyt581eietZpyqN/WwFHhgQcKvtL1+8P4y3VauCUxCKFv7lkqSi29lViMHfgg9oN3yeGYgZokryZaexLQy0TJvl1mKvn11VU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7d5wMjgVLgByAqijEne5H2PuS0ZWg5MyMJzvEg0c21KWOFeL39uF+Y962C9e?=
 =?us-ascii?Q?T9QjGNQi5sK1AeP849+CV7BzuVjwF3dl98203U+kt8Kh0PT0+hRq6cq7KeZx?=
 =?us-ascii?Q?q1TmRy0BZCJNtPavZksmb1Xt+SS8SwuXWd6buSTzQgmHjRaaqOFqotI2KNeo?=
 =?us-ascii?Q?IUFa5LCpd5Eux7Oj7dFnYbvbV0dEPnJc/U6uir9ZaUQwfAQy3YToDx8i4Nku?=
 =?us-ascii?Q?OhDY+4GXQzuTCHxQuR0wuaX+NUYDO0tzZBpGFYXnH0CTF8Gu+PLgUfZy0iVs?=
 =?us-ascii?Q?r4bDBHP1oCWSjZqz3192suC/eurDajgQcpBfnuSX/bIK65MWS43zs3kSB1I6?=
 =?us-ascii?Q?4+xtVUu2E5tTuMJNd305DOiyMR5rM5UNGTeVgtb4WY4zrZKiCJIiHc2C3TH/?=
 =?us-ascii?Q?G0Rw4izkd8Isqt3shQG5dWRNZycKS1x12f1nPn7lRzR/ilEYqoIS7qydNO0I?=
 =?us-ascii?Q?KD51HOBVXlBdC4tz1BxQUltZ0YmmghN8gU8V3LsczDRrB2xLQuEsIYa1XEGQ?=
 =?us-ascii?Q?0wx0DdcAr9V0k57K8n3orshwGWN/uebM5gvRGb81ZvDuqbR13+ai63NnILNL?=
 =?us-ascii?Q?GnqWKPFnktCjpvl0mA9SiUFcKhW2PotEun1EuqwytXVX5XA4RLO/dCsaBq+d?=
 =?us-ascii?Q?2T3qXIVj8DA1nPlChbW1cBClTZ+7YUeACSWqTUD7YS+DfWj5yOzjqLT3LObe?=
 =?us-ascii?Q?XS45BnTcnxHMSKdjTVXzByeQvXzufAlw0Bf4lZPz/ZRDjPRp+4D6Bvtm1q7z?=
 =?us-ascii?Q?tMNzUiNYvoG7kU3dSqOQcY5nrzOeXsWm8qr9JNRmj73+SmgTRBBnKP9d1MzX?=
 =?us-ascii?Q?KKbc0zdnX73Qql5IK/ySCeR7lrAIokqy9Z/OnQjEwU8PyPbDZYcWpnVXJWHd?=
 =?us-ascii?Q?TzZ/ei2bIk+Uxz33nl+QsJqu2dXEwBthT8tzaqBHCo5jjEYfCDzjE93C6KE2?=
 =?us-ascii?Q?OLJjzSmGkhR16FVAgCL+JHZjOWVLUCTHVzxxN62BZ2h5vL0RHNipw3jLaJ1g?=
 =?us-ascii?Q?23R0cOXrnbPltdR8FQKaeH6l4LxvF924/bxmWAU7ddcwkKCt1FJPUWltW2Gr?=
 =?us-ascii?Q?zljE8snyZsPf9mpR2HScdLtLebRO+70V+WYvm4rutrrZc/VWVZUgrTms6iH8?=
 =?us-ascii?Q?LRALmSywrNcJLDcefOED/dTQXuO9Kpu4CEygyrWLvTaI1wRiyJ6DF6Xe3fNH?=
 =?us-ascii?Q?nEfifT7pSkuJzU1YGe6f1hN7tmN4nCTXYCd17T03Gol0AjnEggleR3mzK361?=
 =?us-ascii?Q?DmWvf3cVIbRz4g/TeVqJwL7hISI6tYEIsx5zMxoO44xg5P3IfB5iXNKVImDF?=
 =?us-ascii?Q?wHsTmIfwk1rNEvpy+pmU/BdLDsqMsxmNzrWPxBtUR6YOH0y5rAAV7oxTKetX?=
 =?us-ascii?Q?qBazm14QgX4SphkCKoAKcoGx+D4tA7CiU7t+v1Ew+Q9JPuHJr3vAH6mZD3kv?=
 =?us-ascii?Q?9BQAEyJYIEK5XBNqUTRtViCL775B3kqLzmUQlzpBM9Q55/xUudY55zbs/tgH?=
 =?us-ascii?Q?NdwzFWGTP3dmK9qqI4xRO7Vt4/Z8HMVAmuZTyyH65gVnpaRFE/SZyYoReFai?=
 =?us-ascii?Q?urlz+RzKmYLNzMHoNNFqqQfd4NGC6i2ZR86XbZ2wVRTuZ0i9HsIWoge6mJRl?=
 =?us-ascii?Q?ZsmqvMFCzdpsC1kT6wSbqOCveIH9sC/XB7b+nSvMk0FYBGuqKQKBHgHKxRKS?=
 =?us-ascii?Q?Ubf0kjUYwahi7gXnIAc0UPyEo2cbD3pl8rHCCmi7rZJwrE7MT7bD1pqQ90hn?=
 =?us-ascii?Q?/tU1JBsZ1ng+lhG/S+cZi+wGC5XPgeEU0u9+aexl+tdTTEmLJSGw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03df01e-01cd-4e7d-6673-08df29727d46
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 21:39:41.6421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpD2kDiyz1OkC/rWpykoIQelblqIpnXOOexAc7K3ZeMq/sICQSqF3zRGGz9BalQWmsteqMyeUSq/l8A5/EJ02zBQD/88qDYTO146yGBhxTuqpp8NcfqXzdmI8j4fiFfu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281

On Sat, Sep 12, 2026 at 12:57:37AM +0200, Karl Mehltretter wrote:
> There is no kernel 6.20: the release after 6.19 was 7.0. The entry came
> in with commit 8308510b9365 ("dmaengine: idxd: Expose DSA3.0
> capabilities through sysfs"), first released in v7.0-rc1. Say 7.0.
>
> Fixes: 8308510b9365 ("dmaengine: idxd: Expose DSA3.0 capabilities through sysfs")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/ABI/stable/sysfs-driver-dma-idxd | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/stable/sysfs-driver-dma-idxd b/Documentation/ABI/stable/sysfs-driver-dma-idxd
> index 08d030159f0921b1796b19a0fa30e74c96a731bf..5be4e2d5775ff4c6e4bc82c92bf974cb8fdc64da 100644
> --- a/Documentation/ABI/stable/sysfs-driver-dma-idxd
> +++ b/Documentation/ABI/stable/sysfs-driver-dma-idxd
> @@ -138,7 +138,7 @@ Description:	The last executed device administrative command's status/error.
>
>  What:		/sys/bus/dsa/devices/dsa<m>/dsacaps
>  Date:		April 5, 2026
> -KernelVersion:	6.20.0
> +KernelVersion:	7.0
>  Contact:	dmaengine@vger.kernel.org
>  Description:	The DSA3 specification introduces three new capability
>  		registers: dsacap[0-2]. User components (e.g., configuration
> --
> 2.39.5 (Apple Git-154)
>

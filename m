Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D74CCDE5;
	Fri,  4 Sep 2026 02:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487463; cv=fail; b=h5TSaO/ayhVcGM8zAzcyttaTyVWk1C7I8NmKk4idas/r0Dq47zSiVH76IDfmN19yrtHZ/JVZnPcqs9CqNaYkqciCUe4XKma3AY57tBeiKtQvWnWcrH9vCH8oJQWeoJZ2I0xD9DkQQlhyqFvxrr82/f2ijHM+tQ3MT81JylNT4s8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487463; c=relaxed/simple;
	bh=fO6LJF5MUDespE5U41KtOeG1rk4NtDkLStaClUBvADg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m28Ss34oENZVoCDNP1QX66QmXvKfYUCN/NKK5nmxgnvASPrOw0XETdLDEFUGRM2r1Ph14ikElfx/qWwB16wBvAWwZnz2NiVsEn5rEPTJMXgTDjq8cz3/BY/bdTofTTIQmPPnEzlrCNYYuPvbJg03oKPwokXXYqLCT495uFHzdUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CqPzUiHW; arc=fail smtp.client-ip=52.101.72.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CqPzUiHW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnpqrqZ7Tf1Dkg/rh8yVZM6rSZZG8CC7gQTv9fwXiEF6r3NB2+gZ1OGpa6oZ0x0IpRJ/8sRKoGpZ76A6+GeMEDnz/zOg99z9kdWtlhfRzeyDNKhL6bDsmuWEkuxcYpzaXqez1sIZFfMEiyjykJXUEcFtZUa1wY/3f5WLjmStI4H+IA3ZaIcte/kAGIeY7JrDg8I2cqo9BBHGXXKG1bWDUW1z/sb25JiV2MZB2Qpf7G6KNY/Wp5cHLjcp7fiZqYKaNhsBpi1MpMTWwVvTD8/1Xp7L/KT1f05gMOVPuocJbmxCM26v2Y+LT5pOt1YjT9APqvxJVIyFHNnUkShcnhpS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aajhPoVJL5HLsqnp5i32ArNnwZyUwABX1WXXeggOL+s=;
 b=K3k3UA+riQvyi5fw5YIla1S4FROyAWHDglU9xwvP/Th/INVaXjq4z7IWkp3WgKIWW2aYldMcBiryLPmsE6rurXV+YzyvRshZQuqG7lGvExYaOL3PiAgM6xDHDolkrP48StEGPJ6YjldVXQlWZKwR9tEWqgHKj2wERf+rPZic74yLK0kMeWTPp0Zor9050Xq1x6zwQCkA40WcjbAH4YQ6crTCu02MTysDY9xcaGzrL80hKPfkKilogms7mVGewzTqWvqv6JOJPL44AzGXlYhw9nJdkr/5nuRcNNoVqWh3XqerIpl6xWjf0Yllkac8Qf6ttBKhUa1oK50h2yr2nZcZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aajhPoVJL5HLsqnp5i32ArNnwZyUwABX1WXXeggOL+s=;
 b=CqPzUiHWgyCnmPS+52aBnL3CY6+t0FgtFqK9R/QYNcc39kQSw9VR39i/dDvKMHjQQagFydFJalAmPMvjLJVJ+XXF4dFq5VBvljqBduTEamioWfzjGfW9DLmCTmpWHK5SOPStQVnbwKSiJiDHs4gBcWy4oOrLDd97x8DAZEnmdz1blPLM0LGb4OgmOHjDGtVvhrbfEdLJJCFjb/V+U/rJ2dFYAf+vb2fvGe6paC72QtMbnORNpV7iXAFgrvE45i/zW4Y8Ba43GrXAcgvGMbpIu277ymJyPlxc2AkJJVHZAm8nTkKDwvuQCJo0ar5zKseztYOK2zryyncPBLJlLQsS4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB10808.eurprd04.prod.outlook.com (2603:10a6:800:261::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 02:04:17 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 02:04:17 +0000
Date: Fri, 4 Sep 2026 10:08:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/3] dmaengine: Use non-atomic bit ops where safe
Message-ID: <apooGfaHN5aCO/Gn@shlinux89>
References: <20260903-dma-mask-v1-0-211ffd12c236@nxp.com>
 <apnKqR6ScF2K3GFo@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apnKqR6ScF2K3GFo@SMW015318>
X-ClientProxiedBy: SI3PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI0PR04MB10808:EE_
X-MS-Office365-Filtering-Correlation-Id: 602f5041-ebf0-464e-d567-08df0a28d327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|376014|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CNy+4LNrSF6zg0NnFTPh5rR1yiR89hnjhoerNkMnVfz8tHFShiYKPw4p/mZOd+MGLvJ7WBmxHcglbPqqy/deC6rFx3tTDEP0B698yvv5zJ0B5iIEM14DrRTnbndD19qB2CXrrLUa8Dhr+ZtzdESRILd/9IZNJKzUyXRjzebx6DJGcgKBiGOiqxTN+djGqMCgVn6qormE2zs9HMUAWLlR7rA3d+CQhjsBMcBzI6hygWVRFao8mDjZ/EceeFunr5Bmx0y8tsTiXn+dMH37U8b2iRxvQNZ+CIK9IGaGnnAeYu9pJqCO3NZdN31HgRzoCUyaoIbh4tivAuzXw1s+LuQgAkKwW1L5rYtoI6cam9ZRfo9J5iHxIuibp2yi4eJOKPXx6QwqE+i4+iGxrJ/zaJPppVjtFM/ff1j+4g5iuP92MLP7TmWJq1ID+MJed9JJPkppuHCVJKgWddRFKn4d8HuxYVyIeNSXHtw5okVSA/qHazqpx0Cl/aOJJgxtsU1K2c5CiaDNOoUokClrjXVOudRdvp4QFgurzJr6DrqH5f72uaGfC9r2WSjfo97fzRfU/zuNOQFR6LTr2tKC3uvwJyrSrD9K6/zmOHdZs32NuXJaolIucEMMJPvE5h11g/AqHOk2/IXTWCrPKncgB4b4IXl5PQ3BznJmzz/ozwtj8ToLYAg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ilFWU/fGP2Xjzjfxfw1NOHFta/EWjOxcSQFEU4IT8IoNAsVp82EpWcMObYkk?=
 =?us-ascii?Q?XMnw7P/nTxMPJPk7hQU447kdKWanQrqlxOvCtCMSGo9NJiUqJL/6cRqjyaBF?=
 =?us-ascii?Q?FdmyL5P9H/ttxmjPly44y0ZNwR5H6ktpsQXlL5De/z51Z6ea4ToMYUVw22zd?=
 =?us-ascii?Q?McVW4NbfvbKZBEDzidzaHvTiWIY+Q8yQakxmIlgwRU2Q1mRbwfaPNj2c6Enj?=
 =?us-ascii?Q?/yZk+jpPJjsHF4mvM3gdMQdcrxLvH+KNKHAsRM1PSJ+woal1tIvDf0OQB/w2?=
 =?us-ascii?Q?u4MX4g59rtX+Sqq8QPcXxzWICwU+KoR2dLZ0P3tNLKFwPKAfV56rWCBdyA6k?=
 =?us-ascii?Q?kmaorY7heqjiDX5bhX005chb+OAeG7DnXW76YDBXk6pwagyQlGviVGd2CiEF?=
 =?us-ascii?Q?c4NKK5RXq8fNK3AFAaevCDMR3AuaZ2uhhaKbvv3L5NBklHoOnfridGPIXGd4?=
 =?us-ascii?Q?kzUBGyO691GOti+jQ6QyyK7UfbzzZQ0qLxxLsTOh0R2lLM2yw8MWP/XFu0u5?=
 =?us-ascii?Q?CGQkvluycyXMQN1U1WCNm07ii91LGqSIIc6JJhgiHg0nc2tVzdFPktdOQRGY?=
 =?us-ascii?Q?5kXgCn7f7ys9ZUP2Tw23vTK7InMKg0actZYWmYsfWKxtDw5nXCTg5AQFFGNM?=
 =?us-ascii?Q?Q8otZWu4RKKWnpDjkIvbrhcMswd9fS7yDoNfFLEq5yDKzKNq7qVQvNGm4T7u?=
 =?us-ascii?Q?ObjeOI6z3C/N1h3pOip70n7mDP1Qy6phYgrMYDS7YMeSfwlwMl3RKCdAjDf1?=
 =?us-ascii?Q?K8eDOQGf+2heq7XUMFarysvAJYqRuihYZTAT5YRutxvlaRZSjeIDao0WMGgQ?=
 =?us-ascii?Q?NqDo3tyMvJ1uULyDFoa245qgmTQfWPXE2p4WnumT3k9XFgyh/36Xu66h39R+?=
 =?us-ascii?Q?0KsCngCwucQj2A7iCH4asbTGNay7m/4cU/cNrYuQylVmAXdkvm/Iy7l4deaH?=
 =?us-ascii?Q?cjwk9dXWhKYiUAksULzW3hFgtPCiNqaw/4rz1+CFx4uGuS8m6EJJf/vKiB/J?=
 =?us-ascii?Q?xTo17ddlLHtt7lB+MbWed0VParxahket//yreKEapBkr3hZHjeQQJQB4qvTP?=
 =?us-ascii?Q?kPVu7+Spku83ocESbH1TAi8TBKdNfpf6/VfWM0SY5kwNzQ6hngGCgtnYlv5/?=
 =?us-ascii?Q?sMZ8GgPWWJNosOzabUTnCly/YeVdj2aV1C0+ngNW2RPfXjs/rapoGd1Lfjcj?=
 =?us-ascii?Q?3vBR8wrrrv2YHjCmINLAw5FWyHE2X8+zS4yuj4GjCVbjjTfcnTv+pZ1ZxZSc?=
 =?us-ascii?Q?/X1nuLSU4ZYM5NDXFSzhypn6zXzNo65m3TCYYf4tERSglurLLiAbk9g1feNU?=
 =?us-ascii?Q?ItGXq1E+poWPX2Wuw/ycyWn7vPEyBdamMq3wO4izd/ahCmYK3omQOrNYQ+8d?=
 =?us-ascii?Q?b5dZHCAL5AHqBsvPAntyIB226KBiumU2kAEFzocZfZlUbIE9+uqWdQ+K3sR+?=
 =?us-ascii?Q?Di2cWHo5t5/2Yr/t6zPJMXhaCQL8kk+SW2iEtL6Ap/bn+u9I+YCoqA/hRkb8?=
 =?us-ascii?Q?Ox7Vz6R8AzC94Em8j994SfBbJbLGy9plpAd0+sp75Q1LFBfGT1uBqtvaHUdm?=
 =?us-ascii?Q?pWUqbjYi/STvMwzphEElJ2fGoEkvrflVYzsebHaJS2/4+IleBnXugRYJT72Q?=
 =?us-ascii?Q?EHMr2DMlC8ckQ0aPjyfznYowt0j10UKvKp4V0wg84Pbki3Y23QrJcLVk/GzE?=
 =?us-ascii?Q?mMbzcnnXMEPnLxqYhig3uwOkcx0CK7QMlvdpdJ0yYh2lrGW0b77EElnpC/wg?=
 =?us-ascii?Q?6zb428wny3Oh2Zs60ih1cSaeBQWsyJePWA/aTThdHPVUFH7c4+t0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602f5041-ebf0-464e-d567-08df0a28d327
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 02:04:17.0296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jICG9hvm4OufAomonDd3tmkBLesrOTgxHBe4uOTwFjPKpj6eRucsI0B+mx5uEHb+YgFBBHy54OiwUHIdDMyOhlL4RraByrqdu1OrDhE1SqFE5BoWVyjl/kb4UUNKh0tz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10808

On Thu, Sep 03, 2026 at 02:29:45PM -0500, Frank Li wrote:
>On Thu, Sep 03, 2026 at 10:16:11PM +0800, Peng Fan (OSS) wrote:
>> dma_cap_set()/dma_cap_clear() and imx-sdma event_mask setup use atomic
>> set_bit()/clear_bit() in contexts where no concurrent access is
>> possible:
>>
>> - dma_cap_set()/dma_cap_clear() are called exclusively during driver
>>   probe, before dma_async_device_register() makes the device visible.
>> - imx-sdma event_mask[] is zeroed and configured during channel setup
>>   while the channel is disabled.
>>
>> Switch both to non-atomic __set_bit()/__clear_bit() equivalents.
>
>Any benefit to switch?

Drop patch 1, I thought there were no cocurrent access.

For patch 2: The driver already uses the non-atomic __set_bit/__clear_bit APIs,
I think no sense to use atomic APIs in sdma_set_watermarklevel_for_p2p, or
I may miss something.

For patch 3: Use __assign_bit to save code lines.

Thanks
Peng
>
>Frank
>
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>> Peng Fan (3):
>>       dmaengine: Use non-atomic bit ops for cap_mask manipulation
>>       dmaengine: imx-sdma: Use non-atomic __set_bit() for event_mask setup
>>       dmaengine: imx-sdma: Use __assign_bit() for ownership configuration
>>
>>  drivers/dma/imx-sdma.c    | 21 +++++----------------
>>  include/linux/dmaengine.h |  4 ++--
>>  2 files changed, 7 insertions(+), 18 deletions(-)
>> ---
>> base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
>> change-id: 20260903-dma-mask-ddf64d770f7d
>>
>> Best regards,
>> --
>> Peng Fan <peng.fan@nxp.com>
>>
>
>

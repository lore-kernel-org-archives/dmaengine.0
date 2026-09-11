Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5318E49DBA8;
	Fri, 11 Sep 2026 16:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142911; cv=fail; b=kDB3w29YaUbM5PMJszmicYUy/tgbgp4fgh1ZxKxASrsqbEreY/jJ272GqMbLC5fwopVnKXcMIW5csfsmgeku9yKg+1lGu5F+c4kuYVp1qvLR+nkOFBm/unUMjVQ9a/kw3awtZgWUqLOxm0xV7vxd8NKBERp4T7gzivrdCpwsJA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142911; c=relaxed/simple;
	bh=766WMjsLNnMxy3UWUU1QFX+C2wnkf6C3QzNtjLGubw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qstBsvmcDpDw40ShFfYCIfOYADcm6PCPJn9pve3HJvTrt8mmBQ3qqm7DSqjjYj6SARWdBA9uQgXRmZusKvuM1Fw1O8ALYbcC6XGzkdOVvNDTYmB+JThpsAOWTzwfCnXkvgBgMFi9pG7ASAUJHVz0iZnNRk5PTgBttUCA3OEClZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bdU9lpK4; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bdU9lpK4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyzOLQzOWmKUZRQh82DFMcmUkyeg+sDKtkEN4cxaaCfIkRlQcccvJytcbnf1/6Ikee6Z98ZJ74XeIpSsWjH0vDYMeZuZ/wMd6tZi3VMtamrHxnapOQD4l0VY4A0Mr+6LHiTLidkITRMtCGRKQW6R7kohHClXZ7c1bhVi3IpscKTjGBktOzwSEr+rPsgCI981mE/g+ySBBTCpSzJPbsPPuTYsWLT7zWiKStd1WHg+FbkX0QR+5ZRMSgu/ICbWgPmQ/Y44RAlfTp9YKbrU7X8YfZx2Vx0bVPwKQTvx1sQN/o/ni2eRVlAPk7npPxLvKp4e/jWIeTQiErgT6ReY34h2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YX3vwq53nk8KSNw5bl3yUUfjdumN197xhapXROOPkDo=;
 b=mt2oHc1s0PHJftBZbPjYU0p9Rxw/B4nUlwCF3sWwzEcsc90pJ3RZiVEZ7Dtlyq9zFPntqnIHMEC7Mm0xS3Y9lVoI1+SEkIjo6BlDZ7EI3sJY9VAinUn0iqY2ZGavLbxSC+WeoFjfWLmdsKwX1qkv4YnCjz4xwxji3vMNGXWVTtfsrMLzHQ+xlKdebbOdTD3PzEC/ZgBUcPLtfvwbQD9XfLwVgh+pSPOaXcYhyx4Z8h0WbZ5o5k4d75qRSX4LEkGT4E3nt9xkUS4AJf/2w6AGNt0uoo9IlWVisIjD442amqZ3GZmdXg/i3NCLYK7kRbFJJ1VLCPvbmMcssMUdmTXsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YX3vwq53nk8KSNw5bl3yUUfjdumN197xhapXROOPkDo=;
 b=bdU9lpK42wHBfAXSa+VSEUh2/dH3E/mJY3VgVSw6ICYdJC6VDMprXtz4o/l5ACPsD+d2Zh+RqwXgUkTRfVlfbuQ50jPx28jTcxUtYIt6+VUiXFHbDQVMaU16abYeLJR4EGo/t8q9av/LhqoGu3elAvtP7zA7SjKDTGNkdimkNT1+mD+MVJG4DZmjn4Hm3eFPR5eaeqA3jrlbpEsZCCeQ7Ui+i28sV/ljR7B0TQlWKWfiS7ZjYZn0XS8murKx0E8hSTYHcJCppNihZ2lbhLzt1n4MjKX0seHabhkhdOTQSWfOncaK+i8WT3GpzvrsbnedQwqt7u/81oB6vFG+BQJE5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BESPR04MB698038.eurprd04.prod.outlook.com (2603:10a6:b10:145::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 16:08:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 16:08:27 +0000
Date: Fri, 11 Sep 2026 11:08:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] dmaengine: bestcomm: gen_bd: fix out-of-bounds access
 in PSC parameter lookup
Message-ID: <aqQncwl99bTdW3av@SMW015318>
References: <20260910192404.21809-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910192404.21809-1-rosenp@gmail.com>
X-ClientProxiedBy: CY5P221CA0126.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:1f::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BESPR04MB698038:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4e6fa6-96da-4773-515a-08df101eea11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|11063799006|56012099006|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	kIjn5fB2sL+UjGOQT79MbvFSE3474FNPAtedFPOxYAHyy5TA1Xte61ZWJofexIVMlCTynJ24aTb0kcETIy0HAkMAZVXLJBvGYEUou0EBChNgG2zuKzZ/Q+J9H5b0bYi6c5hln3+o2Ml8JdZVYug5oX2jmnZdi6x4i2yjGQtjrUfEij7BZV8py6RZwA2jAHid4V+Evt7HulUuwfT2uW97vv84OzCAlqyY+OLKbs/JNrbHuqxPEycuE5qLYMU7sdzc19K76/38bGH+JXkGaOozD0vObAqXXdqd6/SUwNc2bxJECHuJ6RIdmvDgUKOJU52wb21UhcwpnKVxPZPjakxsIAOprdZGS4g2S1WMGsUjtL9Stbyck4hkDj/xH7eDZLufJ80pr9LgROlzbiHdbizJkveoZVQG9zjAAbXmeyi8pp3Af5hSNR3/KtQvYuil5LaCEHDhxwllBsvZjoabIGnbq1h5ySY17nOK4N4+KPC61b3eZnyMjDyyK7av7PeDAzCl+en+fzxoPLdz99PQwZ/ysxOjdH7kO4hV5zqQCJYQOz3xVFhBe8PnxWSsAf/azzililskyB1JfJygXNTOmhWPIsSsSmtDlnqBT1Qcf1g9QH56E3eBPw3iUZnvxYesi8MYML6gFN5ikLPVqy+k1oOS1yeAhd0/RAZ0FDBLdZ3ErI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XHpOfKPcv+x1TCyKq7xNtgPjBaCgFbtYDMohrGpG2sGgk4LgSQKrRsn6gGku?=
 =?us-ascii?Q?XsoxbD8+cOswWKv9ir4WXkJa67A0xvajDnx2J7HgDfvVsy3bxFA6NGBJQk1o?=
 =?us-ascii?Q?FVoYkYu/82OTQgt0AKGA5LvA69C0C/AhYb+peHmB2uj+0JBag+sXGTObO0wv?=
 =?us-ascii?Q?NhwHJcvJnjf4S4luhn4OhKAN1Jvo9VnRnLNkyAqrW+BseIzY6kvaJhj4IRDu?=
 =?us-ascii?Q?5ZG+NvXwzAjctj4Rq5+p1MmbkVp1TG4zVhkt1pO0qNTu1gYiAUgozLZw7hqF?=
 =?us-ascii?Q?1g38l/XY+xFtJ2G0b5TVEI6q9hZ5coeqdxBYWUPiV+LJzQGvOI+A1ikn8mWQ?=
 =?us-ascii?Q?vInEkuNRJajAfebjcAkE8KBonHOVXUGhkEmlgXeLpSoEwQQamIIbnIh5Nm19?=
 =?us-ascii?Q?PfERSYZ1LKTWdGvK8jtV3Ly3MO8AYdXZZNpqgQE/eHovj7vlmo9/hO11e6Mh?=
 =?us-ascii?Q?9eenIbkd80hJOZ5o2RGXXEPsyO7sKV0LksDFvgjSq7YX5rv/9ETCI4PHwD3V?=
 =?us-ascii?Q?KrmrfGkFCDseQQ+vwEq2yA/0ECk16A/oxu8hqDGMH3ZAqU3pajS7EZnlo4t5?=
 =?us-ascii?Q?IY39qs5rXc0yeXixN8ekLGhOeB/JBColmQ+GdF5zttAtQTyYiRF2KKN0g6U1?=
 =?us-ascii?Q?gsvMd+jYjCJ87duU7O8sFlSj4Q1Mw8NWRpy1t3DFEeuu9WCn1I/i/EfwV4eU?=
 =?us-ascii?Q?jdHCs+xovVO3xRfMiav7StBulZXli9mKl2iCoOiMa2s0XM3BCtyTmB8NyRGk?=
 =?us-ascii?Q?LI9nIS6W0fTkVLrdCP66Dl4CN+P6Y6t82yS3OkJLpk+ZjAnJdFZ6X8x0mvgb?=
 =?us-ascii?Q?q5dBCr+FG0kKP9E0kW1Ogu1n6lwpZ9kEdcz0lswbDPcCgSag888k4yclwquM?=
 =?us-ascii?Q?vXK5qVWCZmxEH/M2Xs6p0k4/Sa092WDUThtV0ljJ1omQHNv4NAuexpwXIYeR?=
 =?us-ascii?Q?8s5XUUanh/VnJEqZ17kZs4ju4xUDqVKdVUBIg+sqC92QmeYRoEugyY0CRmOs?=
 =?us-ascii?Q?DoUek2Sug8ljiE2NlDZ0qVsrlg/wYJ9M2ET5fW395gwpkpNVdpZ1ma4txoZd?=
 =?us-ascii?Q?JHMB7Pz2e09jVSaqXt25VsaIqGDKkwgVBkSKbSTBhfEexLBbB8jVV8eNDvB3?=
 =?us-ascii?Q?L9mG8CmVNRf1EmNeDFy6hAa16GJshHnWUSTHAyGdrNyvaWacSaRLxhcLj6oB?=
 =?us-ascii?Q?fWi6RMeaL5LDqQuksYlMM/IDfR6KmdK1VGwJgBoY4/DGJspoNPWBerAP+j6D?=
 =?us-ascii?Q?RtGrlYBzSn7Cb1RJt+qSB8EypPLG4XOqRQPoQJmek514aLeRJLBgg4/TV6UD?=
 =?us-ascii?Q?uWAQJDgL2D5lMo9tDiD5gChRvxxFW+pdcAhYP7VynsDZ0pnP202qE2Sx1zrm?=
 =?us-ascii?Q?4LGFC84Nlhjud6nyEIW5tNIGxLnHCOaxAm3NzJ9/z11jmCq/slgOJFOgUM2w?=
 =?us-ascii?Q?WRJJq0CNV1I6riHUnN7NqfYqhBt132q67GRlQbq+4wJnhKVe4NVteNZ5llBC?=
 =?us-ascii?Q?nSI2XbuI0vubTftgOow6e5cfw1VkninwHVgarfpYU+xGRGVDR64qaZvSbWgw?=
 =?us-ascii?Q?6CFH11FD/b7fHjaWRu1a9FytzWsq7rUYQfAar1XZI6oQdraPFDwMQGd82h2+?=
 =?us-ascii?Q?MeqvxWv24M+XyNOlXkpdCBldPT/WZknMAjH3MZ2oeiOvOGlmG7kQzN/GH0Y3?=
 =?us-ascii?Q?rZmjoz+OZBZaJAmSqc9yUSlvwCevRAbY4suCM16ihvLMHAfzjaDJN/nRYVt5?=
 =?us-ascii?Q?KpUEkMIQxl6f54CTAhQ+/e1X4J8fY6B2xC2w3oB6n6rnlhaqynZv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4e6fa6-96da-4773-515a-08df101eea11
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:08:27.4810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdrzLv7/NtnCJyxeh5O1xSglFKmXzuaYqHc2vLi6D+Hmzqa8SgkpBzLsPtBCANaEBUKJ7UJCGDJvuvziJjHisD25xK/4sPYTpiQ4JmdR0S8yTk4otegsl8/tdgRvNRBF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB698038

On Thu, Sep 10, 2026 at 12:24:04PM -0700, Rosen Penev wrote:
> The bcom_psc_params[] array has 6 entries (indices 0-5), but
> bcom_psc_gen_bd_rx_init() checked against MPC52xx_PSC_MAXNUM which can
> be 12 when CONFIG_PPC_MPC512x is set, allowing indices 6-11 to pass
> and read past the array. The tx init function had no bounds check at
> all.
>
> A malformed device tree with a large cell-index could therefore trigger
> an out-of-bounds read. The garbage initiator and ipr values would then
> be used for MMIO writes via out_8(&bcom_eng->regs->ipr[...], ...),
> potentially causing out-of-bounds MMIO accesses.
>
> Fix both functions to use ARRAY_SIZE(bcom_psc_params) for the bounds
> check.
>
> Also remove a stray unused 'struct psc;' forward declaration in
> bcom_psc_gen_bd_tx_init.

use two patches to fix it.

Frank
>
> Assisted-by: Opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: fix title
>  drivers/dma/bestcomm/gen_bd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 61b5746e1a97..00dfdc4b8eba 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c
> @@ -321,7 +321,7 @@ static const struct bcom_psc_params bcom_psc_params[] = {
>  struct bcom_task * bcom_psc_gen_bd_rx_init(unsigned psc_num, int queue_len,
>  					   phys_addr_t fifo, int maxbufsize)
>  {
> -	if (psc_num >= MPC52xx_PSC_MAXNUM)
> +	if (psc_num >= ARRAY_SIZE(bcom_psc_params))
>  		return NULL;
>
>  	return bcom_gen_bd_rx_init(queue_len, fifo,
> @@ -342,7 +342,9 @@ EXPORT_SYMBOL_GPL(bcom_psc_gen_bd_rx_init);
>  struct bcom_task *
>  bcom_psc_gen_bd_tx_init(unsigned psc_num, int queue_len, phys_addr_t fifo)
>  {
> -	struct psc;
> +	if (psc_num >= ARRAY_SIZE(bcom_psc_params))
> +		return NULL;
> +
>  	return bcom_gen_bd_tx_init(queue_len, fifo,
>  				   bcom_psc_params[psc_num].tx_initiator,
>  				   bcom_psc_params[psc_num].tx_ipr);
> --
> 2.55.0
>

Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013031.outbound.protection.outlook.com [52.101.83.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C64D475340;
	Thu, 10 Sep 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058350; cv=fail; b=Fif9pVVU+p8Vc06b4pPHHKJDY504ewyTU0tpkIfaT+duuirLqfIlGrAvKXZeGX4N7WPeecOXGykRqMaK7+4s1QfmYeG4FYZNg+dAGWCmQbFI7TLfUkWSszHymE8jyH+bmc5x9YZZhYjvObFN4OVb1VM7g7q3yY2l3olovOiqZBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058350; c=relaxed/simple;
	bh=6gDOGsiLoLJWlGpfacocfubr4KiVWDscG7PKxkNKNtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XRhXcTcujuptY70lrfdG6ew0wJhROcOeFQeDgO98tCnUL0VY486Zd+YWtcVz0EKt2fx67/rMKDiS44XAPY30gIebLb+6T8LzMTrEJtchPKqNCBsbSm6ZWC2mcQLi/v+lq7aB4fBgixHbAk1L2Cgp5fXalSLpukQyGIi3kLXNw4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=n5O5wesT; arc=fail smtp.client-ip=52.101.83.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="n5O5wesT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKCQsh7S/vYa0ePt0/fhvvv9YlQSGcbMkhNBomYJnSn5MyGolgjRCwpATgQ/GjRZ0h4qwKK7fN29E9lrh1Fx3uewI2+1S0Gm3Vb8C6DO9MtHG9KUpny3PE/3CMyz1Kss8RYjzjDYmiI+/4AX2K7MpQNKe9E0hndY8928cvAOC3FtLAjZRm4h8DJxlxIRkK7BP9mrnXrJL0fE3GTl8gjtz+2Eb/k+T+lRaHdRAf5W/z7o40/Az+ocvXI07XAbqZjRt69rwV+ICDif7q17nakff9cTdruG87HpSXQW2PVKCTYAyRIuybAwkgAMvSqeE7enQzxNZQnHtmxW/4jMTyCK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUdG2K/+YcvD1JLeTWUT7GwL0r8Miqe5BkL8XO2CKrs=;
 b=B6pXt6N/K+LuYNlabi407P4qwasu1nfslAhZCE90Xukd1VFnI0GbjWGeQ+yKlJUeL0XetXFaLtUhzwEuV1z0Kk9C+LtAyZykosswcXVd+m2eIoV74bbebsSPBDJWEuPoiejPq0ne7odp4GRj0GUXfFVJyQFAXmxcZ91Twe3Dk4vdKAqpaDz85pQ2PPldhV9PwpLwk9CI3nnmJRp2f7tFmsns5EkJvGgFIcV9qsR7ro35QDkp3tq2Uy4RdncvfgS3NUExIwHOyh+yVzw3P18g6VJ53MjQ1ma/4Urj50zGmafHv+M4nL/n110goZvJWUVQFbj1I/yXpmlTWg4qMrPfLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUdG2K/+YcvD1JLeTWUT7GwL0r8Miqe5BkL8XO2CKrs=;
 b=n5O5wesTMjwK+vjRXv/i4HSlWxsrEwfDJGHLnEQHni7jcvHucvN4EQ2TB7+MllyGwXaHGP5Ed5s+oNTnyBr9RbKqehngYtpOlvcSZVhZXwXriVwPXyNBKewJds+zvfEpkN6SgfLuRjWVxbTxF8/9k/APFk+h/nJG9VhfZQ41DPmFNSAVccgRZvj3DhjGAQWp8/vLcjjiEfRBrqUTsIDK+2s0s6B67JoKYWHmaEIyqPGIAsgywPXBI5LUdl6WGNb5sBQL94nn4eOa8DU2xoreqWTBmErLkvnEV2262SvUxTNs+4ewN8hkNBnTvUBCC65Ek5/DsKCmN9yp2dvKxDkaiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB529741.eurprd04.prod.outlook.com (2603:10a6:20b:789::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:39:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 16:39:05 +0000
Date: Thu, 10 Sep 2026 11:38:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Baineng Shou <shoubaineng@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: mmp_pdma: fix wrong sg length in
 mmp_pdma_prep_slave_sg()
Message-ID: <aqLdHySYOvQh4UU-@SMW015318>
References: <aqHJKbBTNrreoMuI@SMW015318>
 <20260910021652.1296640-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910021652.1296640-1-shoubaineng@gmail.com>
X-ClientProxiedBy: PH8P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB529741:EE_
X-MS-Office365-Filtering-Correlation-Id: 72777642-358a-4535-a000-08df0f5a06d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	3QBcBFurprvDDEZZjUIBdEox+eNQdC25JYJNRdr/3VaL8iCHdoKj1eMGOiabXMVT1nVOCvKytoU3QG7X123o1VHE0Z+Nt3YLXF5vaGL8na/hTDXqsN26hTZ5QH70ZgcfqIHM6tfmEg41wgd5LcD1LRHPsR9IVOXODLkKQeTlN/+l0ywU17Q4NYfgr8DAAHPxtHPLRNBsb/NubAOo/aG9kHCq654VnGgJ5OTKqINWLRHA8LzBHE3h6KvYVxlGmWwOFwqz6tPC2Ik7SsLYTIzgHOcYggGQkkqQy9pmpmsTPqMXW7o/oym5PA8MXmuVLoJPwswh0VUgN5VRqlif7M5d8ypREYVPZe0rUidz1FtcQxLIyGUi0Z+C1t23093EHw7os2+exPyDF/bGeLJoSf0EOwvOPVtsHGhStb/zD2i4xd4AUlV/j+/uHOcDEQAJkRUJsf1ecQXohzlkHlKcRyiH7Pp+6BviCnas9w35w1a7pIrBWtEfvlDsweOYAFlm4nKI3kvui0jzdIf/LAxP4A0pdWjIMj+psOxP2MiJEwpqN+B99MC3YCG0+XrLwprfZP19XQ6xwXZjk6ve/OnFVC0jLDcbh/xXU9g8Bpww2CTnBcetnM2uzSfmBajs8VplXV5AxY+/eYppoK9hj8WHtHsKqdJj+HnVoLavglIEVzh6VSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5HMB2i3Hnq1m18U96o196/vNjvtLDW8HGQf5StTn5Xc3VvtV0IZN1pqKOz4y?=
 =?us-ascii?Q?oV9oBeSeEMmMknOtl5uVUwFLJt04IvcMPnRYa80Wzm6uvJHAr/2Ph5oB8Vr/?=
 =?us-ascii?Q?zB8eB2tGVJFUGbSRYozKBs88uBUp51BYw08BN0zaBMHQIQjI9v1uoJGbBrdB?=
 =?us-ascii?Q?ajVfWmgw9gEW9YIK7UZkel72GvqAZsxDjRl4AzqSbYROpea7R6Vj1jNVkXN4?=
 =?us-ascii?Q?h1SxhSbKKERIiU4XPJKvgO3xw3++/WPA+CsjYUY5BDoISpIuuM5weohie43H?=
 =?us-ascii?Q?rFJVYVyqX9OhfNPDyl4rP9QyftnuTdUXYcd6v56yoMKeAcA4spr9ElTbTtYd?=
 =?us-ascii?Q?E+RnAc6hmr5Aqay+TKA03GPkxfGjL58lBZ7Q3rCLBLB56xsQdksL+evA1jEj?=
 =?us-ascii?Q?I+auPsT+9RGCwf9kVODzolPMrsj0lOc3l/qYc/iHncMW4qWv8GGAjGiR4iJq?=
 =?us-ascii?Q?pnh0Lxdsl+YcIxOIocZh5Mx6fLQV25QxHjz/p1nXsEY049YPcnFOvwnRhzF7?=
 =?us-ascii?Q?p8Otx53giDYJkaLjWpcSm75+7FJqHDH0NDDuTxI53Pjrh9ZGKy2cyVrdD1C8?=
 =?us-ascii?Q?MFmC2dae5jwsZYgLvwSTivncgF9w6feAbtb+a+b9H32rFPe12uY5iqI/IH9p?=
 =?us-ascii?Q?V28o08nzNEjiF3IJYYLsm0LPwIRYo+uDpM8Yi2D1p0jOLtb4MfAehZ7WqTCd?=
 =?us-ascii?Q?PcmVIowRVmZkAhBSLWNlhRdceQIartQHIT/gArBKZoJdFKYsF6utwX4V1vmO?=
 =?us-ascii?Q?TR3tTxoqII7u6C1IpaJRB/lEcdpHg/RX1OGGlF0tCrCo9+kLMuupj3M1GaNV?=
 =?us-ascii?Q?r2twEMvfUqooMeQogGTkNby5K6JzKBqALuN7oCwYbpNTLrsgEiu9gjPCaKUi?=
 =?us-ascii?Q?PTgRmWikiotWLDhH0Lvh46fvidV6VmGN1Yy6f93axSajPrZdW2hwlRcX4C+Y?=
 =?us-ascii?Q?dnRSk4QZ4gLcev6ccZ4HhX0Cbwf4nGGLn2ZWfqIUryS0JTLPYL34o209MtsN?=
 =?us-ascii?Q?YISbj6AyOgcMv7pIeLeWZmgT+NLmNPSXSqBOx8MlzNDOKTe/kUkavZt7ZGrh?=
 =?us-ascii?Q?ZK+hLZldE5SrcfH8HscwQhAAO6m0Xjpz72ixiivyyG+yj8ZiLW4d/SWBxjVN?=
 =?us-ascii?Q?Ft+87O350LpLl6pUPBGR1a0VcGRAvi/Y3HRTVBMIg9B32KAiaCpSUqvA5gK2?=
 =?us-ascii?Q?eBF7S56WQhnRFcxn/j+OzJ3qVYdDd95NryEtKCRWvHTwlS3ssEhHs9/yjZCz?=
 =?us-ascii?Q?Yir0GXHpHTjGCPs4JxmjhVs8LkXkzsgGyqE5jBwLAHhJYsZ7Gog/6tqjKixx?=
 =?us-ascii?Q?4ECCm5uYYZPqNqVdjRqeUOxVY9k2aZdv+tCDYkZkNRTC6uF59IZ3ONWg0KE0?=
 =?us-ascii?Q?i0eCIHOSOkSRuaeuDwi24GmV/T0ptklz/3SkM2lZ4jVXZQtkHr6uH/l75xd+?=
 =?us-ascii?Q?QDCDHzOk+cK8b3fgpekOZ3bcoXJAClNeAn/hGbzJmqfv2jcqdlVaLiZMmVE+?=
 =?us-ascii?Q?QsT6ZFkAY+R+ZIuyLPAD72C/tibiV1BzQG7JbcWd7OgN+41bsMd6ZaI43K/A?=
 =?us-ascii?Q?Si+3hS9L0OXLQtOeKotq6CX/DiLHaBRlvsaHkWOU8ROjtPkQFM/qoryhYXUU?=
 =?us-ascii?Q?e5zlkb7V7pDgGqVr9CZFxXsX61o9ZHRL2zWmJEgCT8jbc7O8JHBKful5Z4qe?=
 =?us-ascii?Q?HynO9oJy0ub9BqOuKuU+RvzUpwgNgScZ5yjvktFwMmp3oa256Nxvt1aBGjv7?=
 =?us-ascii?Q?d6Yz/aa5QrNcWEUUqPwkx3uyc/swjNJY4sIASX6MTFPTE5nseNkC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72777642-358a-4535-a000-08df0f5a06d4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:39:04.9362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jc7asLWJohKy7FM3W3UzLq5Cx+u2t3PlwQGzAaN76RULbWW/6mujlFyqiYO6ospEisT8Y9upKLVQ+K1eblh4p8Ag46fPdQJKa2FO5Bk7U8xc+7dAoif2YJN+O16ZY8lI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB529741

On Thu, Sep 10, 2026 at 10:16:52AM +0800, Baineng Shou wrote:
> [You don't often get email from shoubaineng@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> In mmp_pdma_prep_slave_sg(), for_each_sg() iterates the scatterlist
> putting each entry into 'sg', but the entry length is read from 'sgl'
> (the list head) instead of 'sg' (the current entry):
>
>     for_each_sg(sgl, sg, sg_len, i) {
>         addr = sg_dma_address(sg);
>         avail = sg_dma_len(sgl);   /* should be 'sg' */
>
> Consequently 'avail' is always the length of the first entry. For
> multi-sg lists this causes out-of-bounds reads when a later entry is
> shorter than the first, and silent data loss when it is longer.
> Single-sg or uniformly-sized lists happen to mask the issue.
>
> Fixes: c8acd6aa6bed3 ("dmaengine: mmp-pdma support")
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
> ---

Don't post new v2 patch to old email v1 thread.

Reviewed-by: Frank Li <Frank.Li@nxp.com>


>
> Changes in v2:
> - Add () to the function name in the subject, per Frank Li's review.
>
>  drivers/dma/mmp_pdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index 386e85cd4882..e90fd2023af7 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -713,7 +713,7 @@ mmp_pdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
>
>         for_each_sg(sgl, sg, sg_len, i) {
>                 addr = sg_dma_address(sg);
> -               avail = sg_dma_len(sgl);
> +               avail = sg_dma_len(sg);
>
>                 do {
>                         len = min_t(size_t, avail, PDMA_MAX_DESC_BYTES);
> --
> 2.34.1
>

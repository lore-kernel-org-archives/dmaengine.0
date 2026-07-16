Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013014.outbound.protection.outlook.com [52.101.83.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FFA37D128;
	Thu, 16 Jul 2026 16:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784220726; cv=fail; b=dTp+ZGkHIMgOWXZ7LIHpyp0y21S/7FEwBEgeC9yxhF5Tv3J/iLdTTrubTgVkKAQFwpztpSy/F1yookWjwpBJ33N2Inwnund6oGON2Ny+t4LIMmgKfHSIda+8sdK0tsx3qTgFyCz2g6tK9IJRSLcdPnYamW43DwmQK3FDvMb1Ul4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784220726; c=relaxed/simple;
	bh=+saNy/L483rvfkDG7hKD3K0DhKNek+A+C1qLEZJQ/5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TDrefGxJrXvwIxxM2bXRM3dfVdf50s9c32FHS51mNc65AfUBghK3u5UUD6qKePfdpUa9CfdwJcLkZlRe6vu+EVQJaFGgutviXbuB1FS7/UX9zQL81t3wrmM4I1dcg019ZVu5gBKXHKUremifCEc2dFWo6DyGsKTbdLWFowHaPz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kxuw65i+; arc=fail smtp.client-ip=52.101.83.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kxuw65i+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9HusilrXA/MR6y1z3aDG2ng1Tssl4+aQ7bQ/uGu94RK+C2Gt8qx8DpxTM4W5m1wr7XYLSfYKT+DrYN1t9YQwhjkY86CKnwmz+pO6en2l71MTSlicRfT2c6YaeaZgNt66vZbsyLPXQ2kUJ0uL5ZwxNQYY5ia33VEOxNxFvswryXX6xTBoqyR8cAGAnDLmFI1XN2sO4Wv4HM2/uWJosGUv1TyqMBqUU88hFpp2LjUSNNeuuXvyb5L3MM8BkIlLOdQoR0PtjMU6k3u3ZQRHPWsejbZkDtPntei9bc55sc6HGFRjVv18ks6Zo4xEshCjQKDr/rLphCa8x/rt0CwAHbVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEqLHhv9CEhclfikOI1MkWchipJswzQy1J8uZOaXh9Y=;
 b=hRs848cChrTg08utAW2+wJV0HVVhRltKkMk/Xva4g3n6x5OsdbalX39QPtdhFYfKZL8Id7ErIB5CrC2hRKXGYfH/MM7DJ+Yzhjr3Sh3MznFH1QY+CN5Zh7ikVPAJ1uPLuPdD7Z/K732ZIhimjMSmRb4Rw+d7imWKyuqJDACYl2dOJtt3DjVhvhxC9oV90L5hIHAjhlgejUfpcv3o02y747R/ZEuhmzu9Wnq41mGcO7Xcoly5g69Yp+hmVhzF/m+w/t0WSpkttYqpG3OsagTrU500KKT44ABUVuYGXtZtjIvhLnywAPclvomv2XtsB5r1H7UcmIaWqfWo+guEGhIt4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEqLHhv9CEhclfikOI1MkWchipJswzQy1J8uZOaXh9Y=;
 b=kxuw65i+6jSN+Rb7/6zSG7XFMAolT1aXtl3cWLQ1UChsh5UR0iRUX+QaTfoc5POFW5j29eaysoUcK0JK5foYvWm0EKBMEZr65tlBp28jYOduu4pqhol5LtwHHwUJ41dwUJgbVv14EWZ1c8xXNxJRj7oN4sVybvi/jRL645RPP2YlKScbzQedYJfJLop4+IU2UiBKiHopc8bgGxbYy8sZWx+fY0baXpPvPa8TQpP7/P0K06PT8uTCexcNL+8/HZI/aVALM15nXMXYvmu4Ebiwhojl0mCUS+M/94hNtpkCMEa065gQK2OGn0vLJA7sDZ0czKj7Bi2t5N2VwS9a3qek0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 16:52:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 16:52:00 +0000
Date: Thu, 16 Jul 2026 12:51:53 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dma: fsl_raid: fix endianness of in-memory
 descriptor stores
Message-ID: <alkMKba4Sc8L46GB@lizhi-Precision-Tower-5810>
References: <20260714233855.870797-1-rosenp@gmail.com>
 <20260714233855.870797-2-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714233855.870797-2-rosenp@gmail.com>
X-ClientProxiedBy: PH1PEPF000132E6.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f37ed1-9ca0-4cd0-4b84-08dee35a8e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TKkWfJ9UKDqzjY3bDhkAU1Mn5sZHdIBN0xMGz3yzd9qV2edffeB+Xx6/UayvRUNO2an1pCnTr5449gtnPullg/uYQTj71MnURB3QesdTT2FXfDiAntw6Tswf1gQmFWNqQ/AM7I5y1NtniZ15ZkJPz6fsFadU83XS/2SqDejHsX/og0NxK5Vnzx72bzf6dYdjbRprveYrCUtzvyudSew/H6X8fvT+e3eoukYR/Z7pwbTNG2huvyg5rShUMeQAP2x9asvN5n8yQlODTrA1yKFmwtKHlIW0Qjmt/KqsjZpiTLQg4HB57/T/XkeIAmw1omGAytZYt+mhd8K2bu57pUXBF4Xj9h9uxGsWGytes5XI2i+eR+soqQu1RTNibNXsUfZLmizrLQky2RTXUl0H1r7AUEBCgYo0RBgsn5+S6M2NIya6g/UgA9ycrg14DlrJR8+jf78Lojoyr9Ck6B8q8mtjbQgx1/efqSM+CR50Ho419C2IH+8Dg9Kf7m9/EPoC/2CG1Vfqu504bIXnt6wFp0gEd2qQ2M8WojxLxAi9FkO+TlA5Dm/Dpv1J+1zUZufuDs8t0k0ckRBXF9T9AGoipdWI8A3glBaj5GTBhA9hhNIVnDm+DFIpHlRlQqXgaUvjjRVQVUOQHGrwdR/PQ2kXo4bL5kf30FqCENpHJw4U3cc//n0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kjwH6Phqx77kiCBvA9y92p51r1uyoPImRL2YOW46hWk/9IPmsqkyPqG6l8+b?=
 =?us-ascii?Q?RqNerJC3wWWIpJSGydmaBOl1gTXG/uVKtphC9PpILlG5pXp3cazTQzGtULQ2?=
 =?us-ascii?Q?bl+BBHdy6fIxAme0LR0bIiKLR861uxoUkPQa8GX1X4W+Pnd2VBHlRi5HmumU?=
 =?us-ascii?Q?R5slgGJ0CmT/bFB6j5hTHTyK5JUGs+yaX1S/Gxhx+Th3/V33rx0Y+aV4Aa4X?=
 =?us-ascii?Q?lBvaKF4LRIu34QnSVYKOq55gWQDB50eYX7s+7Ab8NM2vbQfKJjNsH1R5bWcU?=
 =?us-ascii?Q?NDLMDKG60gGsUHjJIOGzKu6KRAQOuJyhwaHK5hP4+iESAO/1HZPF1N7imJ4C?=
 =?us-ascii?Q?xc5Cj7VRGgRYxrKKdalml6dab0u46GiJEqGqhIVgI8/Hb+vHdaUNjAF9NEz5?=
 =?us-ascii?Q?Q4pEFSNWjIil/JpoBZUqaGL9OhqAOTveKdurmFwC3wUxRTCbEIM4vELENqaz?=
 =?us-ascii?Q?vKmH166cCRZe3yznW4tFM4Qhso4rmLSvuBJFb9jOm8cO0VB21ufVVakLgfiL?=
 =?us-ascii?Q?cdzcFaPRr+nnJ85YoUlOgIPzewKo+TqPdSXTY7X7IuiPjvdHojMuw6ZUoAWj?=
 =?us-ascii?Q?sXZ/aJq2gjBsxEkxfQbVh9zkAovRt5877P1xguzzIuywWYbTXhFVwvx7V+Lw?=
 =?us-ascii?Q?hta0LZqxRkO/jgEcGEAgNSb1vM9c1ofEZGun81cJif/BUstT14kQDU41Mpzw?=
 =?us-ascii?Q?c320h5EFYiKuJcjJeRR9EiUdd7x1dnhQAYMF1SZbvuLzY2tX/ipmReVAnGOx?=
 =?us-ascii?Q?CPwlhgd0YCyml+4sjcwG6e1N0BZb8kA0yzeWqGgXwqSA0Hujn6JSf9xj99XL?=
 =?us-ascii?Q?KhX51jGTXHhi0HEdYcqTp4lbQj9GHN5JuA6xljZaE10QTeMIyaPtk6pEvSC+?=
 =?us-ascii?Q?WrtFMal30FwZayM/WD6tLGbOnwXqw8EEtbuXddBcSAwmNnoNHLeOorWsOtYg?=
 =?us-ascii?Q?J4/xdBZQhQUVQb4Y2njtMik8FT9SKiZ6F4A81LcP/dy3oRbYnM3ccqZjYNqm?=
 =?us-ascii?Q?2jetCjJ66XiTe3V9MfNYgr6LZHDdYoUEWFKQEz6UxxZieDLoKepXKlkN0TcT?=
 =?us-ascii?Q?8m0x9nkhhayPHTDnFSeNvQUH1/hTH1i/Lsx9ZP6Bf333t8ozCA9kDF+TSefN?=
 =?us-ascii?Q?0GJm8kigFtIc04riiRot6s99m/Gj3INnhKt6QWwFjdAc0clMEjN3jeCmS3f6?=
 =?us-ascii?Q?8pa5L0rXZfTPyrU6XEkpXk8cEirNsWMVEOZ/Ju1K91iHEOTr/sRpgofW5je+?=
 =?us-ascii?Q?2xIwDrxgqMgrEE53oBhUh9QvipUKEYAbmPHnzuxfyYQ85yeJBRVS9WNiDSrv?=
 =?us-ascii?Q?chkMkjfWCdIIRRNpNynFU4lw2yXCQfcGMsZ6suIYY9IaALM5gUgthZu5cv0Q?=
 =?us-ascii?Q?Mye4YB1637gOa+4t9tYIGusryb5Roa7r5v3XPHMY4ec+9Onzzek2bGMg0whf?=
 =?us-ascii?Q?kLnC+FkcoBKJYSpMAfzdwzDzznqNHIJKPjaePKcqm6dq2+WL4yvywitoWSZa?=
 =?us-ascii?Q?Y1aA437ZAweqpf0NuvRK8g5SSpaD3OblI3mU10u+9yFER1JXXRoC814GeQNI?=
 =?us-ascii?Q?O/yISHWgWwFK4dzqJppHAw9A/AX82S2cPXTt/r3xkE2laDx/k6/pt9ZwT1Do?=
 =?us-ascii?Q?D5Sl9FpRrmA1+TShWeS8iyZfp48j+AwnEY7kgMx+7wogiXbORmE/0ceK6eTo?=
 =?us-ascii?Q?7ffpjBaVy0o6/8cuTJQIIuGgtSEWplLslaYTmSdMy3Ll/496XpQRevdmag9T?=
 =?us-ascii?Q?VrSq9uY3pyH41Z6boQGsr94RDM2G3vkimcXSaAMKVo/udqtkz5++?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f37ed1-9ca0-4cd0-4b84-08dee35a8e53
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 16:52:00.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t85cwLjE48JPIhvHLM8XEcqv3RAxoGflqSt5m96hGFlqVKegrPsG8is1JC2L37teT1YXcz/mGzm/dWdYo2fxchAED1Ribem6tugqC9LCKkHcKEzRxHI8KwieJ/te7Hz5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8822

On Tue, Jul 14, 2026 at 04:38:53PM -0700, Rosen Penev wrote:
> The descriptor structs (fsl_re_cmpnd_frame / fsl_re_hw_desc) are
> in-memory but their fields are __be32, because the structures are handed
> to the device as big-endian. The driver stored CPU-endian u32 values
> into them directly, which is both wrong (the engine would see
> byte-swapped lengths/addresses) and flagged by sparse as a base-type
> mismatch.
>
> Wrap those stores in cpu_to_be32() so the values are little->big
> converted. The final-frame bit is now passed as the "final" argument of
> fill_cfd_frame() (as fsl_re_prep_dma_memcpy already did) and set in CPU
> order before the single cpu_to_be32() store, replacing the previous
> read-modify-write of the __be32 efrl32 field.

Can you split two patches, one add cpu_le_be32(), other change to call
fill_cfd_frame()

Frank
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: https://lore.kernel.org/oe-kbuild-all/202008111749.yy85rFMD%25lkp@intel.com/
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/fsl_raid.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 99945845d8b5..888f55b672a5 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -242,9 +242,9 @@ static void fill_cfd_frame(struct fsl_re_cmpnd_frame *cf, u8 index,
>  	u32 efrl = length & FSL_RE_CF_LENGTH_MASK;
>
>  	efrl |= final << FSL_RE_CF_FINAL_SHIFT;
> -	cf[index].efrl32 = efrl;
> -	cf[index].addr_high = upper_32_bits(addr);
> -	cf[index].addr_low = lower_32_bits(addr);
> +	cf[index].efrl32 = cpu_to_be32(efrl);
> +	cf[index].addr_high = cpu_to_be32(upper_32_bits(addr));
> +	cf[index].addr_low = cpu_to_be32(lower_32_bits(addr));
>  }
>
>  static struct fsl_re_desc *fsl_re_init_desc(struct fsl_re_chan *re_chan,
> @@ -256,9 +256,10 @@ static struct fsl_re_desc *fsl_re_init_desc(struct fsl_re_chan *re_chan,
>  	dma_async_tx_descriptor_init(&desc->async_tx, &re_chan->chan);
>  	INIT_LIST_HEAD(&desc->node);
>
> -	desc->hwdesc.fmt32 = FSL_RE_FRAME_FORMAT << FSL_RE_HWDESC_FMT_SHIFT;
> -	desc->hwdesc.lbea32 = upper_32_bits(paddr);
> -	desc->hwdesc.addr_low = lower_32_bits(paddr);
> +	desc->hwdesc.fmt32 = cpu_to_be32(FSL_RE_FRAME_FORMAT <<
> +					  FSL_RE_HWDESC_FMT_SHIFT);
> +	desc->hwdesc.lbea32 = cpu_to_be32(upper_32_bits(paddr));
> +	desc->hwdesc.addr_low = cpu_to_be32(lower_32_bits(paddr));
>  	desc->cf_addr = cf;
>  	desc->cf_paddr = paddr;
>
> @@ -374,11 +375,11 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_genq(
>  	for (i = 2, j = 0; j < save_src_cnt; i++, j++)
>  		fill_cfd_frame(cf, i, len, src[j], 0);
>
> +	/* Fill the last frame and mark it final */
>  	if (cont_q)
> -		fill_cfd_frame(cf, i++, len, dest, 0);
> -
> -	/* Setting the final bit in the last source buffer frame in CFD */
> -	cf[i - 1].efrl32 |= 1 << FSL_RE_CF_FINAL_SHIFT;
> +		fill_cfd_frame(cf, i, len, dest, 1);
> +	else
> +		fill_cfd_frame(cf, i - 1, len, src[j - 1], 1);
>
>  	return &desc->async_tx;
>  }
> @@ -504,16 +505,16 @@ static struct dma_async_tx_descriptor *fsl_re_prep_dma_pq(
>  			p[save_src_cnt + 2] = 1;
>  			fill_cfd_frame(cf, i++, len, dest[0], 0);
>  			fill_cfd_frame(cf, i++, len, dest[1], 0);
> -			fill_cfd_frame(cf, i++, len, dest[1], 0);
> +			fill_cfd_frame(cf, i++, len, dest[1], 1);
>  		} else {
>  			dev_err(re_chan->dev, "PQ tx continuation error!\n");
>  			return NULL;
>  		}
> +	} else {
> +		/* Mark the last source buffer frame final */
> +		fill_cfd_frame(cf, i - 1, len, src[j - 1], 1);
>  	}
>
> -	/* Setting the final bit in the last source buffer frame in CFD */
> -	cf[i - 1].efrl32 |= 1 << FSL_RE_CF_FINAL_SHIFT;
> -
>  	return &desc->async_tx;
>  }
>
> --
> 2.55.0
>

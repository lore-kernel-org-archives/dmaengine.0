Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77903749F2;
	Fri, 11 Sep 2026 15:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140111; cv=fail; b=TkxN3Z7QwwPVJ+011zXrkKNwWC9LoPV96h4EoYGaxkW7Arhyq+L+vGRw9Rl/PNvXS0jQ0g6ekmHqoijNwx6SmzoTaTawhMWqOD2uwi2vvNd9zMqjRql+1QHJVlL4mWVMAFjiM6CE70Q420UpQeLIMfQt43r3VDDgu5xCElq8xwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140111; c=relaxed/simple;
	bh=ESd7Z9A5IKhQCWRebC+waNGKDGb623VABo8oUrPe4G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h36tIign3Vv0zX36bjXSWgs+P10MsaAwj6S7pb19x/SGC0g1HNvzeEolrFz4IXxtJEP0F40UoAvSEnfLRfOqW1JYnSNrWR5ZwEGaZ/ukOuZfAKgnB4kC1i8G53Uq/dp1VTEvgO3uuR7qJ32QQTgPwYJynMHnCvCONMEa/bLukOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xu6GHPUe; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xu6GHPUe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=es33BrpFc0C+BC3KyQJfilI3BLj8Jw5K0cSt/Kpm51SgIWWEKGQPz4lzMB45GzwYYNB36aqyZVWlp+yOl7+TceQDuFj+KqnlJuOzMePKmvIR0gkHjA1+oU4r/WeFp6a/Ecd6rnd2XrkPrFQODnJvPmCnnOEiwnBbZX4j+Y/2PWzB5pm+D/mTY7yFOe1eogtrlLZiBYMZ0L7qrd8/rWfryWaNmfAAmyI/l53JJBheLLRr47+RuisWfCO6w2wV7dCHK653MDHgx4fku+KRsYY7mIPAuhlCOfkm7Htgf6pVNOZ0vYl4pf1AI+ngplSbvJX1FCWQxklIA8ZvPqabGqbWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6OYE68HGARty1XI9SLzlJN58qPd6S38RBiNJ+Ho32o=;
 b=acj/CZ6y+CfG1oeFUhzduzf253k7uwWRxGdw7aVQlyd0//C6IzHkGGfwThJmL/ysVU1AFAnlrpUd2zoLOOgIeTnX/mFRLrNLDbvzpgkZuowH0VoP4NIEjUd51NiiqiH+FYx+uh0ozQdlQ1FBoHqh1UTD45F65Z4T8JjgsvXBAdCDxeBdg9rMEJYQYO3bZavxvnj/t7MmmOq40Nil5VzO5vJgFb4g5XqmZkoe5dT4SFCobAk4KcBhSW7yPRIjgFfjyB9uNDBOjj53h7/mOZHlZBjXFoDtTbMmGI5SAgKcbwY5e7TsgBs8icgkv9Keelo7Kz3oxLdDk1NGRHKPlObY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6OYE68HGARty1XI9SLzlJN58qPd6S38RBiNJ+Ho32o=;
 b=xu6GHPUev3UryPMZWLhuxYX4F6otam/FjuM3tBAYEvGLG+GJx2eRRBwXmuF0Pb1Wt5rKkaZkQgSKc7bFsyDfVM2/yC3NCJo9LkRx0q2Uit161CjJfS6NuMFA5buPE2AR2By+/URV0hvxTdA83EmoKnLLAL2g0Jhyz/0dq+a04u/GHZmKY+Tp2K9WBkLft0VGwJJIYCdwmmm863/4qO58Fak1ggcjzLOSyzQr3VDm/dSDqNzYl3JhMbuFUmQ5rZCePWDOE1BZY6Alvpl8YuXFNuDVKzBUrG84o2ozKl39tQmSAboIubz4rAPQw64q3U6IFmMSa0XNHxQMvZ+4/UMG2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Fri, 11 Sep
 2026 15:21:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:21:44 +0000
Date: Fri, 11 Sep 2026 10:21:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4] dmaengine: fsl_raid: check fsl_re_chan_probe() return
 value
Message-ID: <aqQcgEozbioZ2n-z@SMW015318>
References: <20260910200637.41512-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910200637.41512-1-rosenp@gmail.com>
X-ClientProxiedBy: CY5PR17CA0011.namprd17.prod.outlook.com
 (2603:10b6:930:17::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9224:EE_
X-MS-Office365-Filtering-Correlation-Id: ea11e5ae-f356-4a62-df82-08df10186359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|10067099003|11063799006|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	3EwKKsXIr1iKR6dscaNH4JwjDTVkivHzG3WnCp1giyU1iwOxsXXRhs8HdScKw2JQMnfOLp2Xhn+xnily6+RNL95DBrYN1MG9b+bFujP2Oe2F1t5Hk71dFQnZCtsmKKtcIQfn14O/JkEBVp11w2yj4/d2yRt477EeUpKxl+n4iQksNjUfR4Tg2QRk+3vQdL8lpk78ymWbryUOcObS/FOXmLFYJgTxGIfPrwtCOsb69cJcuheW1b1sTUhrAEEdEMMEjUFbn7g0dLz3Ccei7ntmUzfIyHLcCilIXAxDphU0O5cWMGlD733XY/PfxHIoQnZsAt4qnZuIgGOFtFSJSNaG79/KMBYuQEdtorDdBlJrRX6Pl8HJpXhCWMU+r67V2odHCO/fEEfYql7sewO7T4hZV1CMIxEwzQqPy+WO1XawqZkydIE12CrCzMzQAm8VV+XxnN+gFsqvXYtBHDF5CowWrEGgMeIEQ/pDA+tOXATTuE6f5k+Xd4x3IQODUzHWV41VkMFhA5CRuKVJV/4scIaA7ubZSyF03uMuVn+OnC06QJ7sgB+/OWEoDV+BI9HaV+gMLhnM45cYUXgI7aNZ3Mx2l8c9dpd5ID9+d1JzaV5SiM7FAY+EggxnX7F+CFlvNQaYtXdJ6QkRk8NmQjiCCbSbyektNb1ZBw/NYQBa5mWQazo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(10067099003)(11063799006)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CqEDXmUfpyLG/w4fabA+IcvTEzp/1RMlfaCggjfRLToqDgwPaJFQ3ZApiFoj?=
 =?us-ascii?Q?Je+QoyQvL+W0yIfar9Hd3pklu6F5esv2G/z8lVQGCYndTJGrET0AsTn27bQu?=
 =?us-ascii?Q?83LF984wRR9JApHGqytd2OPOtmPfYwhqTuwDka8P3jLvbOlgUro1m7R1RZK3?=
 =?us-ascii?Q?VVZitLNI0IAewOM/Ir2aBcy42fgGi1H2PwJUTUbejxZG7VkKioe/9H2bohP0?=
 =?us-ascii?Q?JY5QgAeFpZ61r62CCtkAKnaG19uxeN5i0HgJ/Y1+mrf07MnPrCGRM27TLpcO?=
 =?us-ascii?Q?spo8O7mDcR+hqPffV/Phf6f14qW1egaDK8uyUKBl3vfa3nntN2Mj+Y+83MW3?=
 =?us-ascii?Q?2mMdiJPUckXkHY7FoyoWUViv1TZGxx93kIKHymZoSBcMuIEtWQawXqV6UpP2?=
 =?us-ascii?Q?4s4N8YosaOVsfDrTsFCk5KO1ZXWYiXdWOVBFAIt7Ljh/LdRaUz8LDDrepLpA?=
 =?us-ascii?Q?NFbQ2DA+/o9sQZ+MLQE2N7c3d3O49ySlwh3z8R3jj1kP8qaBq4yuVazf4cYi?=
 =?us-ascii?Q?QwELDFznrwz6mAQM1xe0lVkgVh8M1VwcMrUS2eZxj2mjuB/b5zosk/c1boHo?=
 =?us-ascii?Q?O3Gs0jkH2f2Cq0JOBtucRRXz8SbMzg3ZD5ouM8CxBKh/sK2HiLhqymbgUN2N?=
 =?us-ascii?Q?Z4cQ3sHAyMAGg6vVUMBOdQZ2+AJzdADTC3utSJe/xsKYMjr4pd5n7Lc3GDYK?=
 =?us-ascii?Q?JHOOYbbqlCCrLFJPyvDRcwFQSKu+dvyRanH9OmNY/NmIXd3I2p6e/hFRehmr?=
 =?us-ascii?Q?r6iK2Qk6hDuiUe2fI9Pj7dtTTf9CybiP0A36YhykBCrEeoRY9kQghS4EMIco?=
 =?us-ascii?Q?KVs7jaGxKpGvPVgRM+81G3fAwshirT7MQLGCd28Eu4blXtq6XWqGZQ63URqZ?=
 =?us-ascii?Q?X0y5F6/dGWF3yB2rKwf49vfG1DboNSwK3jeKCOz3I803+kYgiii/KZcL3DK7?=
 =?us-ascii?Q?pZjnNEd1Cp7gt21LouSY1mDe9BepedJXZIdGqVP1ufXHBaKHA2gB2E8g4Kof?=
 =?us-ascii?Q?/CNanBj74UFxJv2R18dLOU2zQQ2R9wruXeSPLYJ5QvoTeIgSzfDfaO2XxTY5?=
 =?us-ascii?Q?GCrUQzyqqNXSbaeCamo2P/CfByP9U1keKvQMHchBI+u1OGqIfGd9HreiTxVD?=
 =?us-ascii?Q?GUrmDOWAvzsYYB5+8iJzRq9cE9d8t6Xt5BqZvvN7EyLNdYbCFTY7ISPsPUnR?=
 =?us-ascii?Q?s86rg6AJmTJpwxkVnIxvfN2ycXwSj/sTR8k0rJxHDTWBNTUClpeBcU5dMONF?=
 =?us-ascii?Q?VhxmkvF4EZACPUgIfgTGv6ur+2aSovznp3damIUB5H4QuPspClHUvp9SkGoK?=
 =?us-ascii?Q?CoDrtHKrjfD8N0kYbDu2t4SS6pVQXeCIu5bH/vwScrG++XgMox8uY6BprYSF?=
 =?us-ascii?Q?PqVje2JJIKen0zd3RqXGftnXxoNFyAN6VFX3AN1JfwQsed03oRlKx0K1QsuF?=
 =?us-ascii?Q?UFRLio4JOinj25Qv3ZNWL4TM5rE+RKbDdmJmB8YITt0bpRKlSz235l6ELDVk?=
 =?us-ascii?Q?ndLlGpg9tJctKNSp1W9dxRpqQaWvNB2Q2VSMw0kGu25KEulgd/WB3O74zCYS?=
 =?us-ascii?Q?r2+8mOrl4obeDQXBLW+McPXeZ+3OPMzsN0+ML5T2fyauwS8OcZoMXCW/SMB0?=
 =?us-ascii?Q?T2i41+zEWytEiJYEydY5FhuYeaYsL7FDaGKFBax54IM/I4U3kNUAgC1EmMNp?=
 =?us-ascii?Q?lC7zR6bMWDKzDayC68LtIwk9AByRCOp2lIGbRB9hOmo1jEZ9q/Rq7s9QjO7t?=
 =?us-ascii?Q?LaouQTFHYfqZys9NPKK7B6lkkZMI4t+pn4grthtFFZS9K99OCUgo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea11e5ae-f356-4a62-df82-08df10186359
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:21:44.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpmANaRfRE4dbjiCiTYTGod7h2g6C5dsUN2z3Czvc8WYtELSo8ojBgyuaP3CRYgDMsZcUJXbeqoaY/BDKim3i3m/BRlb3jmHhEMSFPLQ5kD6hUD0mCn3PnnkckzuNuZM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9224

On Thu, Sep 10, 2026 at 01:06:37PM -0700, Rosen Penev wrote:
> fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
> unconditionally increments total_chans. When a channel fails to probe
> (for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, yet
> total_chans still advances, so fsl_re_remove_chan() later dereferences the
> NULL pointer during device removal.
>
> Check return value and only count successfully probed channels, and guard
> fsl_re_remove() against NULL entries.
>
> Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  v4: use break;
>  v3: fix sashiko review
>  v2: fix description
>  drivers/dma/fsl_raid.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> index 9cc289f7129e..6167fa652e96 100644
> --- a/drivers/dma/fsl_raid.c
> +++ b/drivers/dma/fsl_raid.c
> @@ -836,18 +836,32 @@ static int fsl_re_probe(struct platform_device *ofdev)
>  		}
>  		/* Find out the Job Rings present under each JQ */
>  		for_each_child_of_node(np, child) {
> +			if (ridx >= FSL_RE_MAX_CHANS) {
> +				dev_warn(dev,
> +					"too many job rings, max %d\n",
> +					FSL_RE_MAX_CHANS);
> +				of_node_put(child);
> +				break;
> +			}
> +
>  			rc = of_device_is_compatible(child,
>  					     "fsl,raideng-v1.0-job-ring");
> +			if (!rc)
> +				continue;
> +
> +			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
>  			if (rc) {
> -				fsl_re_chan_probe(ofdev, child, ridx++, off);
> -				re_priv->total_chans++;
> +				dev_err(dev,
> +					"job ring %d probe failed: %d\n",
> +					ridx, rc);
> +				continue;
>  			}
> +			ridx++;
> +			re_priv->total_chans++;
>  		}
>  	}
>
> -	dma_async_device_register(dma_dev);
> -
> -	return 0;
> +	return dma_async_device_register(dma_dev);
>  }
>
>  static void fsl_re_remove_chan(struct fsl_re_chan *chan)
> @@ -872,7 +886,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
>
>  	/* Cleanup chan related memory areas */
>  	for (i = 0; i < re_priv->total_chans; i++)
> -		fsl_re_remove_chan(re_priv->re_jrs[i]);
> +		if (re_priv->re_jrs[i])
> +			fsl_re_remove_chan(re_priv->re_jrs[i]);
>
>  	/* Unregister the driver */
>  	dma_async_device_unregister(&re_priv->dma_dev);
> --
> 2.55.0
>

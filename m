Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095EB3546F4;
	Thu, 10 Sep 2026 01:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789004764; cv=fail; b=JMVUo68W88pkpdQ7J81jbLM92blhD22rxhbPC+zp74DaZcm/pvaSKdV3U+powDW6S6BjLh/lucLX5tNsM7jwDiyoWzdBuA+yXx5BdRycZkC3rDyDZuIHJEgRpCsdOFjViN+fxhq6SAn2Uo2SKCLOmCf2USRpQ5ROYZTzu+A8kfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789004764; c=relaxed/simple;
	bh=+MzCfGYkWFF0nnFfrMxnRehFa2o9bwOSY4wnUL5YPSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TbIrkQQ+X/lhdHQ9zMOSA9+GJgaH5So2cmq5ZlztVzCFLe+vGq952Iit0yHtrb7pAr9SP+99VYkQYeUnDrNf1XmFwo5/Cu6RBVJ9mOYLvHBMj2oq4TkIs6RT5Poqs6If3iSzMpRxm1poBvR5Wyb5C9Efp8R5admyexcrfAQRYZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JaxF8Mbw; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JaxF8Mbw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxde0H0Dbyyy8iRKP3dU6aiAXmfj0QfqCO74TtMVPOv5qnOVhqmuYU+uWRoI0agedlYv01T92HUY8hlZt9P1M/xeWo9ka8u4pPiFDpypbGZWO0N1Gvm4YwHoWpnpKU8OoY4OORhl5Ol4JRKVd7+jC7algcSKLl9Q5yjxFRGBOnaWScoF2mqhmOHuR3/+OUcfwqPMtOEqZr9RX90UlBsFhlB7m9lCogtPMvXgr4OUtZKuVU6HZLrpicqR8BFmfuwxcVkbXtR7s/zafgORlr/G2hEllOJEnRAe+r/YgcsGR0k9SzgGRVulmTZkoNTIfVrpxqAVNFkk6lNa1HBbJOV5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAagwQN0KNiDUHGrQ2DbiW8Ww2CWDQzSxZZPO4DWo4s=;
 b=io/fv3MdZ5bI2AQaQNuHmj+zgOV/TM/xp3SpUeiZZM4Ti19lQe4gY1arIJpmBDoWc6bGAuymrDClBI9qQ+ndlikpiIQ2r5XsrxCMTYKWRnvTqGFbOpyFsIZgIxSpHb4T9CKxOZJIYMJ9oFnsYxhZq1C9gR4BZNtx8oLWN1dtH709fsxfF6D40iJxFD7qdUdzKjqPmuayxUjJaNzcdBaER0dYAL41m3piqAp78UpJ8nozsAoruHSLm6fyLo/iYock45f1SmT1aQFJZSPGMmg4q8hITYYVmczn/35jeHrW0G11vlExJ6J3PMZ9K5Oncu309/EDBSiHkNADa4w7bjId2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAagwQN0KNiDUHGrQ2DbiW8Ww2CWDQzSxZZPO4DWo4s=;
 b=JaxF8Mbw73XBkZDUCxhTcIiTNiikLyZYpPePNS7yUq1qBAONoF/iTigpyEtsi3sx5/GGLImGI6QHQ8PFESFuW5ItQFlHI+nYx3DT5vI9eg5ONiK1Tuia8w0Gs6k796UevlODyJQx1IDD4GEVzClsy4ReA1rYAITi7rkCfPy9NZ+UiYz3ynO6fbTcITLTxyW0Z1wNTiVDsM3f2J8TP/sq4mCiOfp0HQOjxQfBo4/BM/bmFRX8GOylYkIdecdgKSOOB2H9EyxLedF2pDtthFzxaXNXw2LsiNn4FUqBBNTSLY4eIriRIvXn/mgZJDbHeylmKdalhc1taAeFYXu129+tSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by FRWPR04MB11224.eurprd04.prod.outlook.com (2603:10a6:d10:173::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 01:45:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 01:45:59 +0000
Date: Wed, 9 Sep 2026 20:45:49 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Stefan Roese <sr@denx.de>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: mv_xor: return descriptor to free pool on
 io_win failure
Message-ID: <aqILzde0y_CTT8gM@SMW015318>
References: <20260909234924.103418-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909234924.103418-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:510:23c::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|FRWPR04MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: cef69758-fb88-4fe2-ffe3-08df0edd4378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2Mc2/ZVqhQIZL8u8vbSQbEXUZQM1oey81dO4lv4UrJI0P2Am1H0acKuyEXSnHm0bfR/dXvKHTX+uIVXXp6ysNlvWQ0dDUo39uartTiBvNdQFVcTpoSOGH949gRRANGqMBObkhfAM9F7sST6oEFM5Cgj4uz2LH+w14yMgOo8yTiESJO3pHPDdYEkmpSm26tPZLznnhnWimzKTNdZcJQ7LV0v0LmM9PdUF/X8YETEDGoXIVWzQZn4p/jMtQIxiCC3oxI8vY2VlkjQP2+LUS7Hi+NRC++NcczZYfagMXrqQK4l8RM3kSgmnj3OgoFta7wie1GDBRpbGRSc1qUdxO4ELhMxCV0EZ2dyqseNP9qY1D+eLkIUQwHRpDf0GDVnfEwiRqkdAf/f/4jFgAK3KqvSh3Yu3K42PRIwz5u0gwwJYEmskR8EL+XwbOlXByJdMW0dOcZl0+4KlwDo/dJS2xptmlcqAFdbFr7EHMvcZRaSUKDhgRzySy3MW6MdH1pXwC8dYHBrPMWD2HSEZlKPyGy1jsI/Kf5Cu7yNoQjXBT6HQV8R92jDbrQ9IVCZk7Uv6e4ttK5qGXG2V5xJozSgfqMmnWwZC0fFwCMewg8Nfsr0VTVpSOT6L/gtVGVw51WvwaOrrTeXav7pQ4mD7y08SlzAyVsgFNCREygvPaF5q2DeK4Ts=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bSUmAQrzZkDjrmZrDZLb6Rq0aRURuLu+TlbM449HLEIUYl94F2/8tDjSBnmE?=
 =?us-ascii?Q?auAkxbIDNedcV3lH5cVOFTI2zJ/VIiV4htgoODrdb9Aq7ESrAgdjbneNUPFE?=
 =?us-ascii?Q?IuAV7lldivQLF4ih533LlwxRPDM80lgjnZQ6gk9dy+NwtDncOViTrnIkEFj/?=
 =?us-ascii?Q?Ocb4bDxK0BinOQBZHdKcX78HyG6b4JARVfLa3d39UBeFw7tXNonflBDQyEFW?=
 =?us-ascii?Q?Xnwi/vIaxAy91mqsb0CvN+dsRzKxrOjOwPEJbpPDh+Gfi6da1gi3yWJgVFKF?=
 =?us-ascii?Q?nqRwE3ZD91SGUzv0cmJEIDd4r2UdoIb0fqLSzkCa7WBpNCU/6/GW1STOMMcZ?=
 =?us-ascii?Q?BeLf8pmcjGUqHyu9Z51/pjca6IwAK6qvzhdTokkTmEs3kYR2TzgnXVwjz5hd?=
 =?us-ascii?Q?0hgPnPjDItVGSJ3zAVjGCLLIJm9mBlF2jff65nlB+QESSjc1DYEZ3flZ1tQw?=
 =?us-ascii?Q?4i2kTJzICdWPQciQ5+6bp4BujVkICEI/AKwEsOpIpk+OluTtFQiyqGHVSnDu?=
 =?us-ascii?Q?WRiOtqwaoTp+6TXVtM339Bx8pM5rVPPGqSCl9rOWwKa+AeoaZcO0GmVBQjbd?=
 =?us-ascii?Q?iivD+rk8kNVOXLvdWSrAcnkgNE8jkmhGvO9XZFrF96XU0cNLUboBEOXoRGIn?=
 =?us-ascii?Q?AE+3OSFu14X+zDzHJz0JH8LzKE/AwnKbagfxXk9drLBvv63sbTa1UX+CW75P?=
 =?us-ascii?Q?1OzcOW7/tTKM+OdSxkq5n7KGpAjWjN0+KbQCGqCYu2QYizhk7KX0kN6NH1p0?=
 =?us-ascii?Q?CSM6INcU92QYj3P59ANr72lfgHGSjpV0x9WXt5O4CAU8rSNZDz2Et2KvwYnW?=
 =?us-ascii?Q?R1NqUpMRAXRAnX641mXoqyR8s6oiB6r8QREStrdL/u/KIR4mMizA+oplDtlV?=
 =?us-ascii?Q?3aPk1mh+DI+HRA6BCEhwaREs/NbIyfPgLcx34XpbZ5vSaVledU0EGYcZYl5a?=
 =?us-ascii?Q?D9224F0Gg5t8LobvHlk4qfets5sRu8ifdllCIEEctKAONC6SfkteBtVciPVn?=
 =?us-ascii?Q?ySwqYIvS6x+Wpbn05Xoxhs3N9RIabZrqKmXJIcOya2cR6e9vdq9tU2PBO540?=
 =?us-ascii?Q?IxV9jxcvl4NWVEvdnxIxKY/mj28DQV6wVQhuTySYjUUW6ZOY3SHmLXi1zSRW?=
 =?us-ascii?Q?cpgJzqbe3VggVk9S78IDDEnzANksKINnvq0Lc9c1iehw0IjMD0F0W1N7i6bC?=
 =?us-ascii?Q?4TEUzM9zX5j/mJPU38XU3C4buC/vib7eM0MUsdQxAC92CSRt7HeCqrp0Gvrw?=
 =?us-ascii?Q?2jfe6cbxZY2JHYghIFDMMlGlXlhLIdinfa4HSav/CvIuPV897iy6UBSUijPL?=
 =?us-ascii?Q?+qe8e8Mhist3aX/e4eb0LKz1/bVh9NwItIq46id2p9r44OjM5QN9GY24x3Kd?=
 =?us-ascii?Q?v5S1sd1EglBa+hty/metIQa3JiQpSqSqqolFQn1WzmcIzuUvBx1mYSqPiHBW?=
 =?us-ascii?Q?SKlB2L+gTkHwj0FIHk8EnXev40snrCYB2YnKD6ZThLMUhymh4vvKd7Peghux?=
 =?us-ascii?Q?ttPiRFzCQPNQeh0r8Qh1SWZHAFWgkEHpdElmgWpacS7q/38nRhcA4qehER+J?=
 =?us-ascii?Q?oiZtYCeBuKsQzDbCrxdsPzCu+jaHs2A0HKEiWnSL7WunhvDhzcxYHRYul04G?=
 =?us-ascii?Q?yC9HxFacGZ4Z8QBkCd8i411bzyT/y1iqxgNPdwrxyR1iOoLKBqB82YupNUKa?=
 =?us-ascii?Q?2AOLxVal32NOQNrHFYC6EGG7a5ZiaJSuSNE3tHfc1c/eWDOZwrSJayYuC5Wl?=
 =?us-ascii?Q?/fP8qtgJ/lSFN072+drAaLU8zXrYWGe0HdAXa7kSmSZB3Q9MOZLq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef69758-fb88-4fe2-ffe3-08df0edd4378
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:45:59.5427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2h4Z4hSEl8TSKlQFb9dHolHgsl61LiCvfAGPFUywkCvztPeWErt6qPSVA18QvUIlb3LKhGNKB5GppHp4YfIPiK3iauq1rePHnQ0GmL8mNwwfAN7JBRqRhm+EFrVWxUXl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11224

On Wed, Sep 09, 2026 at 04:49:24PM -0700, Rosen Penev wrote:
> When mv_xor_prep_dma_xor() allocates a descriptor slot and then
> mv_xor_add_io_win() fails in the source-address loop, the slot
> stays on the allocated list and is never reclaimed, leaking a
> descriptor resource.
>
> Return the slot to the free pool under the channel lock before
> returning NULL on failure.
>
> Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mv_xor.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b089..dd4f150d5fb1 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -583,8 +583,13 @@ mv_xor_prep_dma_xor(struct dma_chan *chan, dma_addr_t dest, dma_addr_t *src,
>  		while (src_cnt--) {
>  			/* Check if a new window needs to get added for 'src' */
>  			ret = mv_xor_add_io_win(mv_chan, src[src_cnt]);
> -			if (ret)
> +			if (ret) {
> +				spin_lock_bh(&mv_chan->lock);
> +				list_move_tail(&sw_desc->node,
> +					       &mv_chan->free_slots);
> +				spin_unlock_bh(&mv_chan->lock);
>  				return NULL;
> +			}
>  			mv_desc_set_src_addr(sw_desc, src_cnt, src[src_cnt]);
>  		}
>  	}
> --
> 2.55.0
>

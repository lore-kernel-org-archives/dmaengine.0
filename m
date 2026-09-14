Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05804825A3;
	Mon, 14 Sep 2026 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397149; cv=fail; b=llNdQzOVq9koeHSuX3+GvuWxjonhmBh4x9OCvVMsGs9RCJjDjFiPPdVYkVPVVG1vUEtLdxJkL4bwCjtmTKMHjh02zcq3tWQqV9dlk4vWXfvVIKBWrDCE5DdDUjcudx8Gg4ErZ+DqHTuZQVhDeHZ0EdIkH6P939Y9DtQWV/1fnmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397149; c=relaxed/simple;
	bh=RVCZnRKOzfIW9l4sR89WrOeHq4tW81FHBk3MPT6rDMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bNDbe+6Ngj8hTxm2fKnGgSqNxvE1/V/MpF+Wx5gxRpB4qpAJiuGVUW4RZg5XZTzRy/GOkLJKXPI5pVVsBlgV0VdW9qNIPpiElF3zkdbrpx5uRb9CLjMRnAuiaTdn57AwuD04xieq4klvBJF5u3MrLJchmqOmrEZqnARl1ZcO48M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gxp2Nf6P; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gxp2Nf6P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Buvc1NwpQQaIBW7BTi58gm+sQYc9uOkcapwd9r632ZhGykscmWdTiVQ7oZ2T6O8RNXHDMzClqqH2AYO7jDq8ZfCs9ek9WfQH1y2HbdVzTcPKAoM4neCQgJZIqdHzkq/Hx4WM05FKTVbZFrjPyF5Mt+D+Iqh2Zd/NhSybthRxIU0dfBwGCPCmH4y120jVVu3rnylyRul6u1/ZjEpK6g+p5uEEsYLRmyPtDLbnKpG2OLiVGBd0BzF8ev4TjTWhp5/mASsNPekDgQvivIUEksXopArVFHzmWEv7Gn2GLBdFs7IPfefe+ke/MacYgmmX2Aw4D6T/LtTRtSlt7+onNH59dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvYP272SyZl2wLobxuHNgrdqaIMnOi6azHczdfSn+9c=;
 b=Y7QsrdmrCGHsB2+o6UQQnmVGjoZuXL/qUZvaiSZVoV8K72vnZI7L72/HYYVGSJ+ZQlvL02W8WhI4HwE5XqrThxS/U5SLdT/AAd5y5aJoWjIH7rm82USCNqtBv6BlUO0mwP/hApecpyUBJmPKktPdKs54hifTbxFpsM/qhytP3FCFV845ljXzdBJc+brkVL8hMrqTgtGAq9VT9kOx7+oJM1myT6V+OEGORTnhtcW3Ecp5ncfw5vj+6yXReju04uDPcPvgvRPkPTX2HHsyIQTn3/lswK1+B8dhfx27q/1e2Post7VB9bg/iIbEpUn5dXlspca6Qx8Kd4yfKnXdkUPq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvYP272SyZl2wLobxuHNgrdqaIMnOi6azHczdfSn+9c=;
 b=gxp2Nf6Pql6i7fKEYgfBGoHX8DE6LSnC3GFlrY7M97b42izsrUS5ygH4KcLE1CxbkCWU9/t0xTOaX6YSZu7icELY/dBwZ81SIG9N55xNf5zKr4KF75aDx/OxTv7vC7dI9JDWsaQmVLGmEsoqAryf9AarW1CBM6CW35ua5+Ys8FQSvHLRAIY85wkPZM06qZ32nKvIf2cjRZv+z0+30M6uOG2IEUQ0SbPD2NleGP9LvKpgRVgrG9oCxCGaCWR4/UwjZ3sWzzxZVrUyLCQe1q/Bw79/rDhL0tDIbw/gL6eIWDWwx+cQwjtqe4eJ1WhC+txVMK7VBsNrK6u1Cv8H2dhkyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB424530.eurprd04.prod.outlook.com (2603:10a6:800:35e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:45:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:45:42 +0000
Date: Mon, 14 Sep 2026 09:45:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ruizhe Zhou <zhouruizhe@resnics.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH 1/3] dmaengine: ptdma: Remove obsolete 32-bit DMA
 mask fallback
Message-ID: <aqgIjMIuvwsn9dE4@SMW015318>
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
 <20260903115441.912500-2-zhouruizhe@resnics.com>
 <apnJ7MtNw59x-qWh@SMW015318>
 <AEEA1wBuK97oyrSN8q4l4KpK.3.1788520536000.Hmail.zhouruizhe@resnics.com>
 <aqSCtL2kr6xczuB_@lizhi-Precision-Tower-5810>
 <ALEAgADLK*8PQ9EP1o*6jqoG.3.1789356306483.Hmail.zhouruizhe@resnics.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ALEAgADLK*8PQ9EP1o*6jqoG.3.1789356306483.Hmail.zhouruizhe@resnics.com>
X-ClientProxiedBy: PH8PR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB424530:EE_
X-MS-Office365-Filtering-Correlation-Id: e9804347-ed07-4615-ec96-08df126ed9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|5023799004|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	pb7RtdDfC7/GmLUvUQCFpRSIJAAlozULcv+uZ1r4PclUrjt6lJet9Pr/V4SqPe+bKnLQ2v6QYyqHF38sJvSjKEAoYRF9FNnr5N5syLeQQcZlP814ouTKKXlMQnhk7jK3uh83UPLdHFElWzvitPnG5Fl7COML/VmMRMu+3AKO25p8FoqJZwv6J1N1Z69X9fl5ZcyrVfba/fnoueC9SHCjgf6DRNBY5Ll+XAxPLg879FvWZxjdYivPK6OjJrn3aHDX9EgHqfRxjpnpNR3rn7/g+hOI2AD8N0QjxxpA2Ia8lYqzciG7fbhZGJ3455DDwByjt8gYo+zxOTP7XPiIDxPR03DNJtE4dEODJlFhq21zMQjHnhynHJIIBNupLDs5aSXDW2ZoTSnDyyu0QGz7hchIf8EA4ekJ25Qu/n60jHHfKMQuXmuIsz84GjN3nIc7USaSxuu7oGl6BUMotFqlUDMgZ8lum5nOxDZPQZRRPNECCCTbjSiU06T33Bnwt2/E5+mteGMZYyC9jPgIg30IBs5rKem4/Ff20D42igjZRT23cje903ouadSf2oCrNB2IYKRaDpJbT/vx2bh21LQ8DOMECFaunF5LdFEEyTi1a74kFgqqRWWWneRlwKC9FGBjxeQf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(5023799004)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ewc69ZpmqBHrOUqLhPCpgbzF6babbEeT6mWZxGbNyYyOtqQ6W70kqDa6yJJu?=
 =?us-ascii?Q?+FMGi1gmlK2Xb3QZntdPfoimpUHTjTDq9My7059cTHqjt2lgbaw/cqHV/GAY?=
 =?us-ascii?Q?kI21uXuyWld6ZlemG8Xs/s0N2ACKbYwifxaOiIhyG7iRrj20xCcYYWN5FuLi?=
 =?us-ascii?Q?JFrApxikpwTAuPZ5ByC8KGATekFjVT6SFk1oV+FwAk9DwZh5M0ZDvRds+8ys?=
 =?us-ascii?Q?s1c1XhABnUBJd6I7S7vvxMyaeQTvFsoUIM2PHo+puaujHJjsWJQRPhD/2Nzr?=
 =?us-ascii?Q?6Qk7yEWvS467NwHfyh/qweob/aLIQih9qj3qe8lc0sZotGawN4bvE0DchVVo?=
 =?us-ascii?Q?kJEVidgrr/2+NbLFpwQUIKRqNM3xh1dFsv5D/9RMvdR5D1f4bHDYjSMfWk88?=
 =?us-ascii?Q?NP6D/LxGSuU6Ty1sBjMSTCIdQw/j5Wb165mofuPbPaZY/UIQKUFm/X+2iNAf?=
 =?us-ascii?Q?aT808xFuCUSO+4duHFwx6q+4JZhyv1ivMTff33rfELu8G8kzXh9MDlM7EX7h?=
 =?us-ascii?Q?lpE/len8uDhdnT6S0/pV5UVb55bj2LocPK2z9IVllPnxpeyvvkdp6FNHSPsz?=
 =?us-ascii?Q?8CP8HEFAkApRx9IG4bRiLod8WJdPQsAnCYx53YCHiynT3qRJNxP34zDEQjKC?=
 =?us-ascii?Q?8CDcxnUL3cfdvZwZvcUKr01X3ibOh0dxB/Ho5yJ85GdClHiznplkPvO8BixZ?=
 =?us-ascii?Q?fCebNrQo0qO5VBxu+nSYP91CiEOozt5m98NaWmOjrdNeGkIa9kFVBts63cdR?=
 =?us-ascii?Q?fG1X3W/Qt6xveVsApleDdse2SaUciHUOBfLqSrKHRHO2n70wATuq35x+zdEk?=
 =?us-ascii?Q?qVSzo4BgbM2aTppMq4uCsXEDtAROsKnQeDfT0+ZOc3H5utADt0RmvE2d5oK5?=
 =?us-ascii?Q?UGspsB5VZnnOzlUkYRHhwQjq9VOjRYvzEqBmLkve+zGdyyCz0JfXd6NpadXV?=
 =?us-ascii?Q?eujZK3k68CsbGALsG/MIwh2f5EoZYmL9nxFwWFkIFwKtXA9wtw1O0ID2rFnu?=
 =?us-ascii?Q?+JS7rlXcAWhg0qpe6005aFZCgAEaqHZTbYcUhypvLR5hSMlUDtsq3KTfzQlN?=
 =?us-ascii?Q?ZmF+JwpQwKlKYRCumQgZWhAsNYdhP7GZf2t7aRTJ7FEcbr30Xnav92NpeylC?=
 =?us-ascii?Q?zaV7npICry8lciGE7iaBPXJiBo5vXk89q1GPKvHI0i2pMnBwrDGapo3qZiJG?=
 =?us-ascii?Q?muM4m2cFiq5x0uTJcyH7MpDa3F0m03Q91FkdlGcjBdEYH1L0jSwtwR+PPYEV?=
 =?us-ascii?Q?gmUV1jgXCyoZqjOaV3qI+/bi8SMqdK3zjQv4Z9K/xenh7A8TW6UxgY3zp6sJ?=
 =?us-ascii?Q?6DAyr9bn/ufaMcgl0EKejTCdiNPu7sRc0VqdwjzgDq0nQsHrw15BABLTnjea?=
 =?us-ascii?Q?MmTr4THPxY4RQRayEsVhzLDQ8IVSQ6liKFgOxfzbB/6/mF0/TphCa3+w1IvW?=
 =?us-ascii?Q?ceQxFLaVIHeOzEsR3Bj9xsdE84y5L8XTzTmRE/r073ebEeRaEf9KudvxQrBD?=
 =?us-ascii?Q?vS4HQS9647KB9Q+17k1O41QWLLxuakwGOBimMEsFbDbwoB97M1IrlhA8oKqS?=
 =?us-ascii?Q?HEG7uVHWa/nKYZVDhD+GjOXnOfj4wuCkI/OecvqJZYcMoWg77YELpxHyNBSH?=
 =?us-ascii?Q?4y3QqWIgNplY+jrvshxcWT7IzopRQ+Wl8VCJ2B6fYR0wVwuPaCBwT2qoosOX?=
 =?us-ascii?Q?TQtqxhcp81zXqPZ6JJPbvfHGTZEFcBetrkshpnAV96BP3LvKf0l/jhH4tyJV?=
 =?us-ascii?Q?6nRSLpxlCNy3DPLXlnNSOHOK2LWoe095WPnetNmbduxxIVqjNPzh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9804347-ed07-4615-ec96-08df126ed9d1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:45:42.5201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5bfaa2r/Qdz658nTns0FP1nvaXr8hLzmAJ+E8eG/fT+iQtZi3RCdaMjvrWV6zz9O7RjRYlqswc7pWnLca/aZQg3tsFveBoRo2A0Wk2ncrDhVtrU+j8/guPB/E1CP2x3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB424530

On Mon, Sep 14, 2026 at 11:25:06AM +0800, Ruizhe Zhou wrote:
>
> >> Hi Frank,
> >>
> >>
> >> From: Frank Li <Frank.li@oss.nxp.com>
> >> Date: 2026-09-04 03:26:36
> >> To:  Ruizhe Zhou <zhouruizhe@resnics.com>
> >> Cc:  Vinod Koul <vkoul@kernel.org>,Basavaraj Natikar <Basavaraj.Natikar@amd.com>,Logan Gunthorpe <logang@deltatee.com>,Orson Zhai <orsonzhai@gmail.com>,Baolin Wang <baolin.wang@linux.alibaba.com>,Frank Li <Frank.Li@kernel.org>,Chunyan Zhang <zhang.lyra@gmail.com>,dmaengine@vger.kernel.org,linux-kernel@vger.kernel.org
> >> Subject: Re: [PATCH 1/3] dmaengine: ptdma: Remove obsolete 32-bit DMA mask fallback>On Thu, Sep 03, 2026 at 07:54:39PM +0800, Ruizhe Zhou wrote:
> >> >> [You don't often get email from zhouruizhe@resnics.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >> >>
> >> >> The DMA API guarantees support for masks of 32 bits or wider and
> >> >> explicitly identifies retrying a 32-bit mask after a wider request as
> >> >> incorrect:
> >> >> https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities
> >> >>
> >> >> Remove the obsolete fallback while retaining the error check so that a
> >> >> genuine DMA setup failure is still reported and aborts initialization.
> >> >>
> >> >> Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
> >> >> ---
> >> >>  drivers/dma/amd/ptdma/ptdma-pci.c | 8 ++------
> >> >>  1 file changed, 2 insertions(+), 6 deletions(-)
> >> >>
> >> >> diff --git a/drivers/dma/amd/ptdma/ptdma-pci.c b/drivers/dma/amd/ptdma/ptdma-pci.c
> >> >> index 22739ff0c3c5..d36bb9c67325 100644
> >> >> --- a/drivers/dma/amd/ptdma/ptdma-pci.c
> >> >> +++ b/drivers/dma/amd/ptdma/ptdma-pci.c
> >> >> @@ -178,12 +178,8 @@ static int pt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >> >>
> >> >>         ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
> >> >>         if (ret) {
> >> >> -               ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> >> >> -               if (ret) {
> >> >> -                       dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n",
> >> >> -                               ret);
> >> >> -                       goto e_err;
> >> >> -               }
> >> >> +               dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n", ret);
> >> >> +               goto e_err;
> >> >
> >> >also needn't check return value, it always return success if mask >= 32.
> >
> >Add Christophe JAILLET and Christoph Hellwig
> >
> >https://lore.kernel.org/all/6a4df3e0a0849f179f9747f47b9c8cae53b29b59.1641752692.git.christophe.jaillet@wanadoo.fr/
> >
> >Frank
>
> Hi Christophe,
>
> I dug up your audit back in 2022, and it seems that you did a similar investigation:
> https://lore.kernel.org/all/97ef1b73-a9a4-6018-d52c-4108ff9de7ca@wanadoo.fr/
> Mind sharing your thoughts on this matter? As apparently my audit tells me that
> 64-bit mask may fail on certain arch, so the return check is needed even in that case.
>
> Also, Frank, I sent this to Hellwig, and he suggests me to fix those backends:
> https://lore.kernel.org/all/20260907054733.GA31481@lst.de/
> But once again, I am not well-informed on those particular backends and their HW requirements,
> so I'm not sure what exactly should be done here. Maybe cc the people who maintain these?

It is not big deal to check or not check return value about this patch.
The key point is that we need make thing clear and move to one directions.

If everyone agree, it should never return failure when >=32, we should
follow it to fix wrong implement.  If not, we should add check and provide
clean document why it is failure ane what's means of these failure.

Avoid to discuss these again and again.

For my view, dma_set_mask_and_coherent() should indicate dev's DMA address
width only, which regardless system.

for example, Device A support 36bit address width, which should work at any
DMA supported system.  system should allocate match devices's and related
parent bus requirement and provide DMA space address, which may difference
with CPU address space. This work should be done at dma mapping, not here.

Frank

>
> Best,
> Ruizhe
> >
> >>
> >> I did some more checking after your reply to make sure I understand
> >> whether dma_set_mask_and_coherent() can actually fail for a mask wider
> >> than 32 bits, and whether keeping the return-value check is necessary.
> >>
> >> I also read your August discussion with Michal Pecio on the same
> >> question:
> >>
> >> https://lore.kernel.org/all/aoMty9Dvt2bnWm74@SMW015318/
> >>
> >> In that discussion you pointed out that dev->dma_mask should already be
> >> initialized by the bus before driver probe, and asked whether there are
> >> any dma_supported() implementations which can actually reject such a
> >> mask.
> >>
> >> I agree that !dev->dma_mask does not look like an interesting failure
> >> case for a normally probed device. However, after going through the
> >> current dma_supported() paths and the in-tree .dma_supported callbacks,
> >> I found several other cases which appear to make the stronger "cannot
> >> fail for >32 bits" statement incorrect.
> >>
> >> The current path in kernel/dma/mapping.c is:
> >>
> >> static int dma_supported(struct device *dev, u64 mask)
> >> {
> >>         const struct dma_map_ops *ops = get_dma_ops(dev);
> >>
> >>         if (use_dma_iommu(dev)) {
> >>                 if (WARN_ON(ops))
> >>                         return false;
> >>                 return true;
> >>         }
> >>
> >>         if (ops) {
> >>                 if (!ops->dma_supported)
> >>                         return true;
> >>                 return ops->dma_supported(dev, mask);
> >>         }
> >>
> >>         return dma_direct_supported(dev, mask);
> >> }
> >>
> >> and dma_set_mask() does:
> >>
> >> if (!dev->dma_mask || !dma_supported(dev, mask))
> >>         return -EIO;
> >>
> >> For the generic direct-DMA path, the situation is clear:
> >>
> >> int dma_direct_supported(struct device *dev, u64 mask)
> >> {
> >>         ...
> >>
> >>         if (mask >= DMA_BIT_MASK(32))
> >>                 return 1;
> >>
> >>         ...
> >> }
> >>
> >> So dma_direct_supported() itself cannot reject a >=32-bit mask.
> >>
> >> However, this does not appear to be true for every path through
> >> dma_supported().
> >>
> >> My audit of the relevant current callbacks looks roughly like this:
> >>
> >> +----------------------------+---------------------+-----------------------+
> >> | Backend / callback            | >32 can fail?           | 64 can fail?                |
> >> +----------------------------+---------------------+-----------------------+
> >> | dma_direct_supported()        | No                          | No                          |
> >> | default dma-iommu              | Yes, conflicting       | Yes, conflicting       |
> >> |                                                | dma_ops state       | dma_ops state        |
> >> | ibmebus_dma_supported()    | Yes, !=64 fails         | No                          |
> >> | xen_grant_dma_supported()  | Yes, !=64 fails         | No                          |
> >> | xen_swiotlb_dma_supported | Yes, threshold         | Not due to width   |
> >> | ppc dma_iommu_supported()  | Yes                       | Yes, if no table        |
> >> | parisc sba_dma_supported()  | Yes                         | Yes, if no IOC           |
> >> | parisc ccio_supported()         | No for >=32          | No for valid dev       |
> >> | alpha_pci_supported()           | Yes, threshold /     | Can fail if no             |
> >> |                                                | mapping dependent   | usable DMA path|
> >> | dma_dummy_supported()      | Yes, always           | Yes, always                |
> >> +----------------------------+---------------------+-----------------------+
> >>
> >> There seem to be two separate issues here.
> >>
> >> First, "any mask wider than 32 bits cannot fail" has direct
> >> counterexamples.
> >>
> >> For example, arch/powerpc/platforms/pseries/ibmebus.c contains:
> >>
> >> static int ibmebus_dma_supported(struct device *dev, u64 mask)
> >> {
> >>         return mask == DMA_BIT_MASK(64);
> >> }
> >>
> >> and installs it in ibmebus_dma_ops.
> >>
> >> Therefore a call such as:
> >>
> >> dma_set_mask(dev, DMA_BIT_MASK(40))
> >>
> >> will fail even though the mask is wider than 32 bits.
> >>
> >> drivers/xen/grant-dma-ops.c has the same rule:
> >>
> >> static int xen_grant_dma_supported(struct device *dev, u64 mask)
> >> {
> >>         return mask == DMA_BIT_MASK(64);
> >> }
> >>
> >> and xen_grant_dma_ops installs this as .dma_supported.
> >>
> >> So, for that backend as well, DMA_BIT_MASK(40), for example, is
> >> rejected.
> >>
> >> These two cases seem to directly contradict the more general statement
> >> that dma_set_mask_and_coherent() cannot fail for a mask wider than
> >> 32 bits.
> >>
> >> There are also cases where even DMA_BIT_MASK(64) can fail.
> >>
> >> One example is the PowerPC legacy IOMMU backend in
> >> arch/powerpc/kernel/dma-iommu.c:
> >>
> >> int dma_iommu_dma_supported(struct device *dev, u64 mask)
> >> {
> >>         struct iommu_table *tbl;
> >>
> >>         ...
> >>
> >>         tbl = get_iommu_table_base(dev);
> >>
> >>         if (!tbl) {
> >>                 dev_err(dev,
> >>                         "Warning: IOMMU dma not supported: "
> >>                         "mask 0x%08llx, table unavailable\n",
> >>                         mask);
> >>                 return 0;
> >>         }
> >>
> >>         if (tbl->it_offset >
> >>             (mask >> tbl->it_page_shift)) {
> >>                 ...
> >>                 return 0;
> >>         }
> >>
> >>         return 1;
> >> }
> >>
> >> If get_iommu_table_base() returns NULL, the callback rejects the mask
> >> regardless of whether it is 32, 40, or 64 bits.
> >>
> >> I understand that an unavailable IOMMU table may represent an
> >> unexpected or unusable DMA configuration rather than an ordinary
> >> address-width limitation, but that seems exactly like a reason for the
> >> driver to retain the error check and abort probe instead of proceeding
> >> as if DMA setup succeeded.
> >>
> >> There is a similar state-dependent failure in
> >> drivers/parisc/sba_iommu.c:
> >>
> >> ioc = GET_IOC(dev);
> >> if (!ioc)
> >>         return 0;
> >>
> >> /*
> >>  * The max IO Virt address will *always* < 30 bits.
> >>  */
> >> return mask >= ...;
> >>
> >> For a valid IOC the required address range is below 32 bits, so a
> >> 64-bit mask works. But if GET_IOC(dev) fails, DMA_BIT_MASK(64) is still
> >> rejected.
> >>
> >> The default dma-iommu path also appears to contain an intentional
> >> failure condition:
> >>
> >> if (use_dma_iommu(dev)) {
> >>         if (WARN_ON(ops))
> >>                 return false;
> >>         return true;
> >> }
> >>
> >> The intended state is:
> >>
> >> use_dma_iommu(dev) == true
> >> get_dma_ops(dev)   == NULL
> >>
> >> because the default IOMMU DMA implementation does not rely on a
> >> dma_map_ops instance.
> >>
> >> However, if use_dma_iommu(dev) is true and get_dma_ops(dev) is
> >> non-NULL, dma_supported() deliberately returns false, independent of
> >> mask width.
> >>
> >> This looks particularly significant because this was explicitly
> >> discussed when the default dma-iommu implementation was changed from
> >> dma_ops indirect calls to direct calls.
> >>
> >> Christoph suggested moving the consistency check out of the fast path
> >> and doing it in dma_set_mask(), "And fail the call while we're at it."
> >> Leon replied that he would add it to dma_supported():
> >>
> >> https://lore.kernel.org/all/20240718070406.GK5630@unreal/
> >>
> >> The same discussion also says that the default-IOMMU state implies
> >> !ops.
> >>
> >> So the resulting WARN_ON(ops) path appears to be an intentional reason
> >> for dma_set_mask() to return an error when the DMA backend state is
> >> inconsistent, including when mask == DMA_BIT_MASK(64).
> >>
> >> Another concrete case is dma_dummy_ops.
> >>
> >> kernel/dma/dummy.c has:
> >>
> >> static int dma_dummy_supported(struct device *hwdev, u64 mask)
> >> {
> >>         return 0;
> >> }
> >>
> >> so dma_set_mask() fails for every mask, including DMA_BIT_MASK(64).
> >>
> >> I initially wondered whether this was only a theoretical sentinel that
> >> could never be seen by a driver probe, but there is a real setup path
> >> for it. acpi_dma_configure_id() does:
> >>
> >> if (attr == DEV_DMA_NOT_SUPPORTED) {
> >>         set_dma_ops(dev, &dma_dummy_ops);
> >>         return 0;
> >> }
> >>
> >> Since this returns 0 from DMA configuration after installing
> >> dma_dummy_ops, the device can continue through the driver-core setup
> >> with DMA deliberately marked unsupported. If such a DMA-using driver
> >> then calls dma_set_mask_and_coherent(), the return-value check is what
> >> prevents it from continuing with an unusable DMA backend.
> >>
> >> I agree this is not representative of the normal case for a healthy
> >> PCI device, but it does seem to demonstrate that a 64-bit mask is not an
> >> unconditional success guarantee of the DMA API itself.
> >>
> >> The formal DMA API documentation also seems to reflect this. In
> >> Documentation/core-api/dma-api.rst, under "DMA addressing
> >> limitations", it says:
> >>
> >> All the below functions which set a DMA mask may fail if the
> >> requested mask cannot be used with the device, or if the device is
> >> not capable of doing DMA.
> >>
> >> and dma_set_mask_and_coherent() is documented as returning zero on
> >> success and a negative error on failure.
> >>
> >> So I think there are two different statements here:
> >>
> >> 1. For a normally configured DMA-capable device, a 64-bit DMA mask
> >>    should be supportable.
> >>
> >> 2. dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)) cannot return
> >>    an error, so checking its return value is unnecessary.
> >>
> >> The first looks like the intended normal-case invariant, but I do not
> >> see how the second follows given the current dma_supported() paths
> >> above.
> >>
> >> In particular, the PowerPC IOMMU table failure, the
> >> use_dma_iommu(dev) && ops consistency check, and dma_dummy_ops are all
> >> paths where the mask width itself is not the problem but
> >> dma_set_mask_and_coherent(..., DMA_BIT_MASK(64)) can nevertheless
> >> report failure.
> >>
> >> That is why I currently think code like:
> >>
> >> ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> >> if (ret)
> >>         return ret;
> >>
> >> still has value: the check is not probing whether 64-bit DMA
> >> addressing is supported versus some narrower address width. It is
> >> checking whether the DMA setup as a whole succeeded before the driver
> >> starts using DMA.
> >>
> >> Again, I do not work within the DMA subsystem, and therefore I won't exactly
> >> claim myself to be an expert on this. The above are some findings after some
> >> digging. So correct me if I am wrong.
> >>
> >> Am I missing an invariant which makes these failure paths unreachable
> >> for a driver calling dma_set_mask_and_coherent()? If not, then I believe the return
> >> value check is needed, and the DMA HOWTO document might need to mention that.
> >>
> >> Thanks,
> >> Ruizhe
> >>
> >>
> >>
> >>
> >> >
> >> >Frank
> >> >>         }
> >> >>
> >> >>         dev_set_drvdata(dev, pt);
> >> >> --
> >> >> 2.27.0
> >> >>
> >> >
> >

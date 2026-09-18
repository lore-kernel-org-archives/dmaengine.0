Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3D63DEFE2;
	Fri, 18 Sep 2026 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740256; cv=fail; b=SdaweyGPaTgqtmlbRGyOl/Z6BV/lzLA4jHATmuluS15Fr+qp5VPwQ5SV99/TVgRgHUWJxevZuXHzY2zHFG3bSWNGOQJv90guTGShBiKyS6z5xd4nbv08wu3mL5PsHXmlThJJfBXBTEHhvZIHlu4dJy7B7vA4+95xQzHNrmAoB8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740256; c=relaxed/simple;
	bh=aXZie+btNJqICMf/pIj5QBCyQekyirIJdhepiEnPl2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oe4stg/EcSP1RVU00+150MZDc9t12rTta+BQA+FpzphWNLFwewiWkquB4GvMvyycERjbcxCGufdpjEO2h7mbEhiV90Zn8vGOBsJIXA3mTbFUpNIoRenkR2TyTzn1SftPK2A6K+PdZAGv0Qd/HHK2ZzcBWZmhCeQLPnfTUu5qbxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lWnJ6KQN; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lWnJ6KQN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxYv3M+iR+YEfGNNGnRRKViaoWt5+qPx4G5qw52W/ZBCaUCzLqMfljvCNMWbKk5DLeEyIztUBB1zx8GKu/9rpWLk3ULIs6KD2oe8z3Rjh7lo37deCPDXsY07nIB9XNKP6solMkFI2mH7tDduFu1Em4D3qx7lwSALWqrKWNB0ldVmZdqIqq2yQGMVqHX7qi4l3ScH8eI8q4s0E1RSAcHr5dhn/6FWeCaGEoyQntqkRKekuCgsjRQL9AUdo3YCBTLKxG2EZMORtfqqZDGpsZC52ypqqWrOQhywTTUZU3PETftTn1b8+EVNcofAIC11VpnefttVOxw6eKAdKlUrRwzs/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJrLQh98DJdlvZ3D/Ud+pVkA6IfLUBVYoUOUH7U6O74=;
 b=s+SNTR9GeAmNq+8IZQUg61Koqn8wO9rjGW0VEARA63hxugspA1bZWVozgdtXkSOY4n03c1FYKM5l9ktAqvFVjDMMIX1qFZcfyURwHLXtS/J6sAHjRI5w3eopIfz1ce6Q6UDDt1qcv0e26sEuOIDNxUmwC8DNpPtaYqwDJSOI6kBvAQcxMHL1X2Vx65V5QUc0P8pahneidHZjoRa2KLFyU/NvgQ71ZXmWFy/kD6YfLnYnmR+yjp8YZVx8cT8HsZFGr/9e3qb2pqMRMtJKyURyyY/G6lNMeJOUXgAzFhMiHAOYOQGAYTGSO5AieBz2OCO0Y8pbulWNCkGKbSiOZKdBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJrLQh98DJdlvZ3D/Ud+pVkA6IfLUBVYoUOUH7U6O74=;
 b=lWnJ6KQN7fC6NyA80gM3e4UIYUrArue8ycwGIGXY/E+ziuyFovO+mo1ZPDsgTbAHBbzygPCNGuqkrmilX/Dla0iVK6iC5wQoPG921bUhB2m293G6WgXzsDootQLwgK9DjPS5XEbU7i6Pg8T0lg1arqLlu/ZJyik8yvKic0eWn45PdLUMYZ1qyn06hyy+NAwY8OhKurvUHgeh5RokpPFv0HYWFTnlVnOfBwaS8kWU6pNp28Ani/ymtclnhpQphDhV+0o+mEkn0Kr5+hrANqX7RgZi6idOtT1kMj9jfGtEzOXkETCt/oRpKr0HSTIaJlZQ4WJ+DS01Yo/ys6kO6qk5rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8690.eurprd04.prod.outlook.com (2603:10a6:20b:429::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:04:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:04:10 +0000
Date: Fri, 18 Sep 2026 09:04:02 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Baineng Shou <shoubaineng@gmail.com>
Cc: Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: dw-axi-dmac: demote apb_regs warning to debug
Message-ID: <aq1E0lpvNOwmybRt@SMW015318>
References: <20260918101414.4104604-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918101414.4104604-1-shoubaineng@gmail.com>
X-ClientProxiedBy: PH7P220CA0049.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d93cc1-0f7d-4923-c918-08df158db63d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	M5aqVDEs2o93RHYrSm02Ri76JvMkoICPCHlVj5QaEzxudG5n63ycxUFBaIwHJWuJjDBp6Vl+zxOROy9RXfSC259SNOCmlUIUDmtrFFW1ApUsbz5S60xj9KUIM9nxSyVRGgkwfMCtuL7oFtTw7mPR+t5T1PeXRmRMUGfpSKbr01pjqAdUNyM+k2HJCjXuIOW21Fz/aqfLD8AV2MUiZCkhUStZTdaoiCa8mgcbop3zqL/i5rI9mnIfWlioXglw0OccVfoyCFtv6+NLgwV+85SIPOu5BBj2Y3ZLbFCox0WskW2s9wBm4XiPLL6bYES412wyg4cx644vrDJb6/gGIgtDROcnwmJGdzvjFaxR/lngjczYgntmE/svRaC3EkytKo9Uk05lZhLAgiC7/ENV/PdKfKMC1uzY1UnVRfpC3leIqvVKresX0PwRYW0Z1a4xenAr72nhQ+2UHqpW2jVp81LyfA5qAD5l+3OTIlXmHVSa1wZablY014DwAZ87ZzdL5fMCF1b18uASE11eKn+lSQavelpfhQ0AWwnO/nPFjq13JbmZwm24+unhyal3PjdAXuHsafwrDqC1iZTOF1nZ/uUdmX7Ne4AG2h9sHngRW1AZAWqdXWepj0vwnsfcSgxChISxzNihiNs2lwuudHIEFb3lLIZe0RlVPgSUcrD1BK9YiL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wi/9TCsifL7qopdJfOsj555kbIyd7Jg2ZQqkZ8zBYDF5f9LQce5vkxD4yCSG?=
 =?us-ascii?Q?sPQCm3L8SfPFSckEeMbHCxAhQj+j0fCSvE0HdQ1CVJbZ6FoBC6Tlsr7Bk50l?=
 =?us-ascii?Q?zCX3erTRBg/I7JGjfZxQtITXzQV7XJFSSNILaAxEEiLrnYxJpVl6g8fc3MeZ?=
 =?us-ascii?Q?YgxYB3nJv/gs/wpPcXZ3hD0buTqloyEMYfjk7xfcrx2AHstUtIxN7+mGXu5L?=
 =?us-ascii?Q?iXjqYXWRblRbIju/Wsvflx17ANF/m/OTpak9Z0fI6XE4Eb1lU0DIVs6C6lAf?=
 =?us-ascii?Q?WOaoBeYsv1FbLhxuOWDrQLihN32kugqrCkL5eCmeA2oK/wSpg3l8acGn4FQ5?=
 =?us-ascii?Q?KOyh+lgRQ9uTMZPtU3k1KbjA51CNnd5SYwbeHMv8x38ezTPrEI+tYgPpoL5Y?=
 =?us-ascii?Q?4ytip6MKs40AHz5jUlH//i4qFvW79TOpSjGhKgRoILnxpC3JMTGLgT2iWVNk?=
 =?us-ascii?Q?iEa7FWPcHv/ZzW12KqtAhnPiRQrHwV4UK86xxOqrChZgLcmbMTVZmEzAHwjd?=
 =?us-ascii?Q?PdzTERaAO/dhXVk6MGISEW2JNdnfSq7GAPaFS5JhVDW6L3W2XIGrICHKK2XS?=
 =?us-ascii?Q?r+0L/HwxaTkL2UdCtZxJ5d2nQpfX4BObw59OlCN1fSur1VPkXqgdqKkv5Y9h?=
 =?us-ascii?Q?ntK1ZKZ4qlJx9Bw6ilglfT2MuoOaNM2Af8lQd+ktFB9CUSwJWTXg5OBjbVWj?=
 =?us-ascii?Q?icdv8sFy8PU+/fR+M+sykb21A2IiaEdVKiqpZ17M7o6+qIHpdQM828GJl+id?=
 =?us-ascii?Q?32JkKgfspubq1XYzHhK3gLVg18i46O/mU+1j/eiBCq5eD4n8ppJUQlHjxfix?=
 =?us-ascii?Q?Nshh1aSAeTx4eq3ngOD+hoOP5AoWPWvD2yzcb6t0T/mwy1AzENo+kIM6zHNQ?=
 =?us-ascii?Q?Gr5O+MK/69Re40RLjEgXYTI/Qn4CCt4D6CYy4qhijfSL2ONDSWneEnUPLZ9V?=
 =?us-ascii?Q?6Cv6a9gQDjS+p94sQLwuxuIipM1VFODCEcGNnTrg6MoCwLoJrUDaafk2UkPz?=
 =?us-ascii?Q?zajrpGu3SLdcWkWcZrSTlgpkUJfdtoiv4lQTnAoHQyLkwrnk2wMjUQGUczgw?=
 =?us-ascii?Q?Pe1dAMMOivxEswc0s+vVDocJFDsruBKot7qVKqwbhosDnuSRDmGuYdzzB63W?=
 =?us-ascii?Q?Wz09OfHwDExNfcDdgrBo0plL7O+UpicdME8ziXTFO2Aeqki/U3IKBAFHnUSv?=
 =?us-ascii?Q?6ednmIVVa/FRdte17iPp8Dy69U6+r5CJsN69+20JUhhwmPLbfumXet1193QE?=
 =?us-ascii?Q?b7LiVCOgbF59uwFtWSePeZVgE7fLQlTz+aejSVT648CD24ZWwM7dgBnF8yPo?=
 =?us-ascii?Q?zZ/klF3RNR302qX8rkcn16MqY4wNr2K6TguHzkk/8n+FDcGTzHJkM4hPKi3Q?=
 =?us-ascii?Q?QoB0Lfq873wS07zTA5yY4bGm8kAmnLAO7fGnMp0JUKGXUMCJ2xF/3758KGO2?=
 =?us-ascii?Q?saG/o5+No1WTXjCVUwqey8A394b79ax429d54E5P8yGpC5bmgQiJRl/7Jf0O?=
 =?us-ascii?Q?asm4XEV9xYJ6dI9qd1hNb1NkqNKUZ+prgikytcKBkLKZ7yYob3Uwd3R+hNEX?=
 =?us-ascii?Q?8U9fFnwUMueCWH3YIDZ+go/c4P6qOHxT3VbX8I+jYnRhSGYUKD+M38DouBM+?=
 =?us-ascii?Q?87ttiTJzcxIXiqTIK56xQURstx9KWQxtLRH+bo/KIkM6Qg7R1vupo4jXvdYB?=
 =?us-ascii?Q?EHDqBi7ZptcKTQJoUfcYTYTJCjKSfWO00JtUd64vlUWwueIaUiVDc+hnSmi6?=
 =?us-ascii?Q?LTwYoZve0gCzT0t8vcaUY6Vh/qq1p+WzNia42T7/gowrwWaE3aTV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d93cc1-0f7d-4923-c918-08df158db63d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:04:10.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkS/LClH0eDWo2PQU7Vb9PIYd7MR/ad6URWQuxTZxPZW1fdutxbUGdM2az+SUPVpOmpauqbVyVaZIoCsXWZ+J9XIxOFnnCoh//7DqGq6KGVdAL7+zwgCRXc69NHYumLf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8690

On Fri, Sep 18, 2026 at 06:14:14PM +0800, Baineng Shou wrote:
> dw_axi_dma_set_hw_channel() logs "apb_regs not initialized" at err
> level when apb_regs is absent. However, only Intel KeemBay
> ("intel,kmb-axi-dma") carries apb_regs; all other supported SoCs
> (snps,axi-dma-1.01a, sophgo,cv1800b, starfive,jh7110/jh8100) operate
> without it. For those, reaching this path during slave/cyclic prep and
> terminate is the normal no-op case, not an error, and the err log spams
> dmesg on every transfer.
>
> Demote it to dev_dbg to match the identical check in
> dw_axi_dma_set_byte_halfword().
>
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index bcefaff03b5c..d829b9af5491 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -574,7 +574,7 @@ static void dw_axi_dma_set_hw_channel(struct axi_dma_chan *chan, bool set)
>  	unsigned long reg_value, val;
>
>  	if (!chip->apb_regs) {
> -		dev_err(chip->dev, "apb_regs not initialized\n");
> +		dev_dbg(chip->dev, "apb_regs not initialized\n");
>  		return;
>  	}
>
> --
> 2.34.1
>

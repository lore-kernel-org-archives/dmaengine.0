Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010026.outbound.protection.outlook.com [52.101.84.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15507299929;
	Fri, 28 Aug 2026 19:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945562; cv=fail; b=fgRfzrLF3ChLuRBPFLokhXWnIJ5ZWns7FLUQn5JXg2r82i4giSwFnpNfyv1Y7DN2tF+xheTlTu3YijAjBJwduewGqefb092iFci2TLS9UWDs0Y+MAadbFgdz4hGdoDHYwBMQZG7c7y9zDSzuIgHVMuHnHJi4mL87i2OMangCr/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945562; c=relaxed/simple;
	bh=/2ALHyUXMggsR92uY8t5v1Ld5GZnH2OvraRgdkVvg4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l1UDHGYL1y5bTxHUCpBH8iAPwcSHatzqS57Gg1NEof96AUxQhCGfZtJmmttfXaHRROFoyZjYkjUcDR+H9LagUq72rRr0edHmTliTjhwprwVqKOeNUMfrGFKM+JhGGHTXRC4UvKnzEo1ZaBz4EhtyuNQsBpdinBuv4YLadIi6FqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Kn/nLfwq; arc=fail smtp.client-ip=52.101.84.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Kn/nLfwq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehMVqfFkt32j2q3oBlZbHA0OabOcHaGF/F1lsiHoqDvizrx6mGNX2Bvxme8V4dt3vQzMVAIoNkWJVIhfrFGVsfbOInbhWFSDsAP+iDtVEGsbqPL3Njqzb56Ee/qs+Tl6B6dREibKd+KHH63wPfyRUowi5JDE2O6ZVALR5ngfUPIfTPP4uZvd4ADDdKzDuCkCkCJpoecwe9W8WGxQcxEC7SEbAj7bLpc7wDI1BLfKgcvGkuL8qInxJBjesgKghOpNqRkRTKQWmqlkz3aAbLk73UhhPOibU+VkKlgiX9MW2MhTnAbgqyjJmZ+xQ7fbJpLxeTEfnoKLnPY+IaHgKCbc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjlViS6i286c2k1rNJoDNNvdQaQMDmzDFJB0DPLd+e8=;
 b=bmefUdF689hxW8FT0dtd5GWOhvxqTDQB+s8MyRxbZ20Du9OWd+ahqNiqjjDIfeH11aqCp12ZD6BYyo1LS/AZK2yAdVRz/cHRG7ayouwUE++kJckZIF5z5Hyp+RVWLb+9bhBMY1yPzUW+NwgqZXPezT3mtOIWhEMIIl6dJvA1AuIbUZMUpnAcip6UThs60Qwvjj6KqvFnmocF0lL0Dh/yiGlJQNLkypxX0Kcb49xK2WubHpfSjjKhOkc69c7cWiOcZ+YdhThiXOepC5jGNKHS6i/yWKjwoujiiDV/9mX7wFboVEscGiphm5/jJi3qy/QB+scxjKWFcti0s+5hSeRZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjlViS6i286c2k1rNJoDNNvdQaQMDmzDFJB0DPLd+e8=;
 b=Kn/nLfwqWgSrSPWiRySujv8KmXEFva5PLzTivtMjokxh6cvEnPOpNFKFndImgxJu75JnkdvWUCFl/Re5vB+CjDN5mCcct1SPai6vz4b3XVl4My4F4OVzGlW7NEGON6EfL/yywg1SsYMSz/ag+lyNbFHz9L7vqr0M6rveZwW6S083UcJyQQay8hN/bkVA9goQXY98vnpdl8d+lHhbc/3PLbcRauDjPjxZtkW5FsEtFiZ6DXkmgQT39ZayG+AyhQR4gtXuR+OohHrjbvU/RI2a1RZbk0hurZH+xxGN052Ilh6e9xBtVrx1Q5o6reUNj9lRk9tT2w+WuSeakad8WvCDfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMVPR04MB12674.eurprd04.prod.outlook.com (2603:10a6:20b:775::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Fri, 28 Aug
 2026 19:32:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:32:38 +0000
Date: Fri, 28 Aug 2026 14:32:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Pandith N <pandith.n@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sia Jee Heng <jee.heng.sia@intel.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dmaengine: dw-axi-dmac: Fix AXI burst length encoding
Message-ID: <apHiTZRqN0UV87pW@SMW015318>
References: <20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com>
 <20260828-dma-fix-v1-1-a6947f487e07@ultrarisc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-dma-fix-v1-1-a6947f487e07@ultrarisc.com>
X-ClientProxiedBy: PH8PR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMVPR04MB12674:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ce4ae5-6c3c-424a-adbb-08df053b1e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|10067099003|4143699003|56012099006|18002099003|22082099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	kXwwi5BirQtcwCCjlvY6WAZPbZ1Ghsbfryp6ACCsIIprIxIrnuzDYzVzNDJUDVsHolNVDByCuy27g9a9J+HEkHzQ/YzH1IZxOXkLbCzrwl9kA4Y3d5VGHXjFC8zJEdqYHa3tSIIXUPQEKk8L1RnYnSfnqivOVgklHw203K/TxLlw1ezOnuL5HEmvuJ4jth5MZ6WLpnUARW6c+VyRiyPO4mlFxP0Wropp1rK99IZMVfwmh/TFg7i4yRky+feNes4Ax7i2x9FdeVXgjlhXdvQ/WUU6/BzFRpTPB1+ZFDCBho5cLKBLPai2SfLrJw4tSUx/zhbr9FSNuW8cEFAfG1zRTaCGg11/0s7EJzoIb/v8inXUwtgGAgNi1XKnbuPeqtoMlzfaCezTYqjrRnh5gsH3iIf0yWtv9XVy3uZ4I1w5hYaGcpfoYfoHW8FwT0mnSbPMNPg8g8wLjl9gMG5gHWAiA5SdHjR/Xv/ReMBaUdNg5rkLXe1t5CxEyHCy17XKI8ZAGNmOAwPTzlMozP67+Eyfqfkbq66RfheT3DG74fUSJCR7mCFZXaJmcOErW+5FnOgnlGYqLibFffnHNAwIh14grI1rpSZEGGKQeQauekNwvVImrU41iSJiTxfIE15Rb3unpLNL/ehx4GDaRjwbwl/S+ACo7dD7dwwDjwRcTc+igOI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BvD2G1eP3B8mrXOmdGPWfvxCH4xdZG3SA5b1F2DfsGY1INx9CFUfxZUhXHWM?=
 =?us-ascii?Q?7+EJhvHqSuKYdd/KUMO/JlcZxaj5CaNZbmIkPTj64ZCzYPBeqc+dUTnNcbis?=
 =?us-ascii?Q?C3oV9q4K7ftu0UU/gY6742qVcOReNbaBqkNrsrs4FECzr4r7NZjLNuiMmW8Y?=
 =?us-ascii?Q?dUfPg4JKqrmQPzSg73Qe0FOlhoYLJnbH1YrUQ5O029UC7e02jx17yzWuSV4U?=
 =?us-ascii?Q?TSwmT1LYJHR+f1qPK/yjLyRABjOvwd/PlGuW34KEl4juzgNtMSoVokcQn2Ov?=
 =?us-ascii?Q?iIUDXwxL5YET+/6gnzJZ83IX9CIlwoiU79sQfB//wbNjLODOwPXS6MWVLgQJ?=
 =?us-ascii?Q?bvpLDXOacFVLOPKPwQuN9SkvAk0yPNAk8ONmY11KVxYmC5yBx91JXAgVccZR?=
 =?us-ascii?Q?/AR6v6s7EMlkQcVi4lTbMfmaEqVnER9v9SAve+sSJE+pa7VZMOSel8m+i7Rm?=
 =?us-ascii?Q?QOGTIk1s01p5TwN1pldD6kOQOyEQdYMcPIMmlcX+QvDnPjlnHkzjMpJtY/hK?=
 =?us-ascii?Q?bhzkYHfTVkiSPKhHUdkwv+y9cyaoSPYOfFaSILFjlNgFORZgRgeM+h28k0Bx?=
 =?us-ascii?Q?0eBYHeNCVCEK45MKeYGaSv6QmiFg+6jDcQv5OdIpUA4qmhXgwmYIo1ZGHOsc?=
 =?us-ascii?Q?ZR4alxi79OhUpYmk7HvBTkahRbiW9KVDlO+oNwK8urODQzjQMoS/xh8K/DNs?=
 =?us-ascii?Q?0RXNeoVspJPWPLXRcj+EEYDjTytnqjLK3r4GLQECKYYH8AYpjcboxXDnLiHe?=
 =?us-ascii?Q?XWYC367eIb/7W0EqUhfmRriNBpGKW/8nP9EEl/sN2YPUaAhEvrx0UqRxeZEt?=
 =?us-ascii?Q?JZnfPX5EGPDgwjyUaYaTQPornm+ajd+r2XOC+fj03jIZtw53IYPNGT2KOQpv?=
 =?us-ascii?Q?KtmD1O9uX7GwgaVeaPUhFKlEVTanpdUGG/L9MsZo6ZD9X/eJaq5GEVbR+bEH?=
 =?us-ascii?Q?foOc/V5HtaowBVys6Ns07FnFe6WH/qV4Jh2sfaJYtV/PcT26i6cLkCHxahMS?=
 =?us-ascii?Q?IcVULccyKazfR0hA+LP7j/GkcqFsz1gxX3Q7sCmJ9EsLt4knvlkheNbs29r9?=
 =?us-ascii?Q?CzsYr2jnFocfF2fAweZkm6g9Wy0OvXsS1LJS2jp5yVTqknj0Equupxybp0mm?=
 =?us-ascii?Q?0jXInlHs5Wpor9yL2567+Q+ibiILHtowIjMgQ/FsN1m0wkjdUdNJGhfqo+Tv?=
 =?us-ascii?Q?bNQPc/99BPF4ucfkA50uLLnzX01gbRrGwW4CXkoZzjLi6hXvKIvncRMsbure?=
 =?us-ascii?Q?tCs1pWUPcSrK/djeQmB6PisRHWnGxcsZXyOeoApC9SXOg/NP4WtZZIVZ1juL?=
 =?us-ascii?Q?C4lySzPWJkGeSMEkQV6mKvFg9+6MZzSH8yM6JxJy/TEN6f7+ACTrt7HFBWbp?=
 =?us-ascii?Q?2RJhqZFFKcQMwFFVO7mMll6dkjgk7ZZXh8ev8br5V8iDnBNw7pQJAO/582GS?=
 =?us-ascii?Q?axlesbJkzvubDidHTYwxY4jV6Jjo+9L8vQ77/dzJjLkiTGxsvmlJqlTVs8dg?=
 =?us-ascii?Q?YxIvtZddsR3K2A3ozA/dvgQ84sjKE8ANVoBz/J1cvrMcL3lskyT3rHVg7SnF?=
 =?us-ascii?Q?kcJSblD6AGTsHz6R1clKioTVUfvZqQENtZYcbbyD1DSh6a4dep7WX4XnLkod?=
 =?us-ascii?Q?LwYt0Te7wFU1LxUtGoyOhJmI0kM9soTpAuTJKM9ao5SUyLgiCohUs1JlAmJ5?=
 =?us-ascii?Q?wGeeIqep211QcQYdmk+4rHT/G1EsUaDFygUli2TrZFgG+PH4gifjZVNgwYzh?=
 =?us-ascii?Q?TL+u/gEyIn3LgtMTp2OvOAKsDRDddOkngylQ0GqBN4PHOnN0emf8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ce4ae5-6c3c-424a-adbb-08df053b1e1b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:32:38.0725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iftrLuDBtUHmGmKYv8t02rBePKkLnPT/aIktifVU1bobZU1WC8dBbgzsQOmcWeJeS2TXr6CS/jV/8JW1c3J9/eWD9XYvcNtD97RQpB/ZVhs2BVWAbqeDryat5sWTxVZo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12674

On Fri, Aug 28, 2026 at 08:48:26AM +0800, Jia Wang wrote:
> The snps,axi-max-burst-len property describes the number of beats in an
> AXI burst, while the ARLEN and AWLEN fields encode that value minus one.
>
> The driver keeps axi_rw_burst_len as the actual burst length so that
> dma_device.max_burst reports the correct value. However, it also programs
> that unencoded value directly into the hardware fields. A value of 256
> therefore overflows the 8-bit fields and can cause AXI decode errors.
>
> Subtract one only when constructing hardware descriptors, while keeping
> the actual value for dma_device.max_burst.
>
> Fixes: c454d16a7d5a ("dmaengine: dw-axi-dmac: Burst length settings")
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---

suggest switch to use FIELD_PREP() later

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index eebed2474210..742e08cfab43 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -706,7 +706,7 @@ static int dw_axi_dma_set_hw_desc(struct axi_dma_chan *chan,
>  	ctlhi = CH_CTL_H_LLI_VALID;
>
>  	if (chan->chip->dw->hdata->restrict_axi_burst_len) {
> -		burst_len = chan->chip->dw->hdata->axi_rw_burst_len;
> +		burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
>  		ctlhi |= CH_CTL_H_ARLEN_EN | CH_CTL_H_AWLEN_EN |
>  			 burst_len << CH_CTL_H_ARLEN_POS |
>  			 burst_len << CH_CTL_H_AWLEN_POS;
> @@ -975,7 +975,7 @@ dma_chan_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst_adr,
>
>  		reg = CH_CTL_H_LLI_VALID;
>  		if (chan->chip->dw->hdata->restrict_axi_burst_len) {
> -			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len;
> +			u32 burst_len = chan->chip->dw->hdata->axi_rw_burst_len - 1;
>
>  			reg |= (CH_CTL_H_ARLEN_EN |
>  				burst_len << CH_CTL_H_ARLEN_POS |
>
> --
> 2.34.1
>

Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2661314D18;
	Tue, 15 Sep 2026 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490021; cv=fail; b=itETMyPoMHet7qxp8zv5R3PPrVhYeXN3w1QApko0SVH8Zxt7KTkRJa7BXeYdVnkgtL279kV3Rcz8A/SQmjP6LoFXsiETae5XmIipfgCvMSWwE9rX4GN2ah9+Q8fneGr/Q1urg9YQH6KfYrTydECcIHvROiZM/AOvixXajRDFCCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490021; c=relaxed/simple;
	bh=9ssxYOmXR2RKUrDfvSFzqjBIZvK8JrT6QBPSNa/5QcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XCybuMDu41wDB6010oCoGtpnUtF2JzgUdBC/nt/x3QcWbx6aqxCk+aC6ppStucN+9PscVzqSeHR4zcgF3nuwOTgCklH+Irx7qgjCJMBygvN42JCAiaXHJpEuP6Fnr3Y3pTo/Y4eOckg1EACTKSv60kWlcJP2YO2vI08mVcUZr0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BkVxisDL; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BkVxisDL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n14zZDljsicRLJrsq0ijkpA1h41sEMzHGUP0QC+L+RAbb1Cu0qWeJUX+XiTzUULgujy/QBeJo17uLdh6b6ZifxTV9ClpUUcim+iVQDxnWwglmFK+et8oqGveGJirrON6RIKWcJgRJMN5tsiRfTKPtvcJkMDEoxRtOYnITl5ZbdXic98lJ86KGQKulLvX0YzCXckXXT8R7266zk0c29QzMkzAmfTlPhUQFNQX/zb6pKzV/T3CLZ9Lnsq8aszk5XN5VlhxhtTlfR895HPaqrsm2jOqbAckusVL84SYNgE1HOYmbmF1Jq+/xCjrSqcziSuZNqjob4AgNW8udVtiirShjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO4q5Xz7fWFB/Qy/cEjOmkG45lZudVrpC3cRuWwdr64=;
 b=XOctsimGdFutbHlSqQMzlivf7tBHlCohlp6mXXQji24EI8xXigXSblTtSUZ53dA1KfA4kY93kmKNGEhC/5E0mNyAlx0rsmA0ej2Z4QVSPPEjPEATKck4aF79zbhWKdMeRSN+zvdL5xuhRImA2TycippaFUowcJiTAFBAAAiJgtxAKmvApOA+tb7LnbWb6wqePv4YFT5HNiI6Lnuz81mXd6+ESKklnsvKjwEAITPWY2pogVcjrH1Xxf9ZotIrb/9Vn47bSSxWrtC9YtMcj9Skqp1DZx9/UK2JWlDBa/KaMoiJCuLrKrpYA4AGVGAjD7n6BG5Eoaizb+ArOIq8dL3xfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OO4q5Xz7fWFB/Qy/cEjOmkG45lZudVrpC3cRuWwdr64=;
 b=BkVxisDL0PHvVPftpkLc4HWZ6SMwxYDeKVFpib2TkPdZD5nQvkmWvwOyY6Tbtb2ZsvULfmYJnnVAhrQ4tH3az8xlXAGNGfCcia+dbjPCtlI/hva80/BNWspnwnl7pKFaGyi49gr0Idur3cL0BW8FY1C/jxdu5FwCgp5FdgI5gBBW1uMcbH5F2WyH/1qFlKls8l5Cuc6vo9efs1XesVAixk5eQFrpaR7ilmBM2q6cubMs5Vbpo6VAj75D9jglzH+TYDqkMuwteghgHpHrwOSwUHfCSRfl4oCRMP7v3wPT7U/saFVV31mjpEnXHtLI6rR1s7P42ZOwQgCKko23czEArw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8679.eurprd04.prod.outlook.com (2603:10a6:10:2de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:33:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 16:33:36 +0000
Date: Tue, 15 Sep 2026 12:33:28 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dma: dw: use designated initializers for
 acpi_device_id
Message-ID: <aqlzWNeguqifqIAZ@lizhi-Precision-Tower-5810>
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
 <20260907-acpi-dma-v2-1-0ffe4a007992@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-acpi-dma-v2-1-0ffe4a007992@thegoodpenguin.co.uk>
X-ClientProxiedBy: CYXPR02CA0096.namprd02.prod.outlook.com
 (2603:10b6:930:ce::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: ae5dce4b-d035-4102-2308-08df13471725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|19092799006|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GI4BudlHo8x1gcV2D4ha644DU38GzZkEqvfylMfF6PmO923+x9CIXntZpwrsXnNUe+AnERbvGfN/mwI2RwCzaImupGUkqGLD5QgdjwaulmxsygR8ffkbwkASZsPT4k3BlpOKyWa0a9Y3G0YU+wT95ARspsuJM1gVehYWA90hgsqjFlOUGbHSxlPybkMwZNF69qm7/VTS8Mo/4GOpkjOs181x+BfAC7YBNgjwwyxoEktIhdBGYYE78Hy4qvwm6lSB9nSf8ayCfqsS2SvzQoDvywp6PM92yalMpBiPEovdL5cm5CSQ8Jd1BZmYO3fVUK089f8W+sZPbBxOj8aVd+mAch5AmrcMrHzbLiL5u0X3CW9Dgkt1Ms3O9KyEpIs1Y6kJELDFiFqvsK5/mL7nDtCbLsTx3feWcgALFjxrSF7ORKK0Z3tJQg1Mv3xUQEsBaV8beDk6TjoSsynCA6PsEAOv0ge0l6FFy6dOWyd9YJB0rA8HFMW+dhmCBY0K+oEYO0niC6yt98Ije8e591DR0ipqpA/TKWD3hg2XQ9Culp+3LGJmuzH9txgDzlt18F0nOy+DLsIUKtayhX0Qdh+O2dQcm6gtUu0z9NebEN2vbG0zGssDqnayMUUUZKiIrTJUz9vGVlg0hHYh/vdG4/MEaO5bB6iaQ4dMyPcQdAE3FOK5QcY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ng2+2Gmep70GpiI0UDjBej4m2HaPUHq9NyF1a+fsgPy8A5elBU+IpIyui069?=
 =?us-ascii?Q?W7f06SOr/ab4fOTg4zuHusxNflc1EHoOWpM8e8aIcEzCeqU6YahsAydoKfVG?=
 =?us-ascii?Q?3arywdtbnftzOA+f+wbY6y+SSi19lXFWG8dOmZWIcqNz2E5I2s37yH7zrJfo?=
 =?us-ascii?Q?GsaLDxUjSrfzcrwvW27dRtSSZXU/ckcXLYaWQAJ0YsfjHQ7p/RqDAHn6yiEe?=
 =?us-ascii?Q?dJkv+efJuS68sjr/zCEQlYvRu1mmdWBu7XQnTcRoqxXUK8Y/ISZVYxrMBjAA?=
 =?us-ascii?Q?0QGST5PtUg/RVxMS2uPzIMg7OLV0JS/gy9k15Dx4gTEv04Nt1joQSA0DHzeJ?=
 =?us-ascii?Q?57GbCAlJW3CmkO5+vLl+G9yseZGwY/n5yW7jw/XsiAvQBdCxozeWjEj271wU?=
 =?us-ascii?Q?VfMTEvahNfDlsJLDzso6pY21Ze4fzQpj2WttlNtMjIzcJSbmkCDDk3OV2heg?=
 =?us-ascii?Q?+iUUCUJkq3bAlYZ3MUbFcLn+jNVmEUKCfBiZPa0miF3ueJzGFCOt6O2F6jK/?=
 =?us-ascii?Q?UTw0ZDBqaAzHiVsONFhcX+RjkNwTv3Dk8AZSobJrOLxKeTIJ+LXg+SGh5i3m?=
 =?us-ascii?Q?H5qcSjucULGPQrQOhonYM7o6eU0J7GYXUd46Pp9RfNWuzkfN1QMyNEDwpDHq?=
 =?us-ascii?Q?qHB8IW1xCSCcDxzyMSKUIMcUSFO85e434BuEEF90rgXjYBP5F5LdyHDW/o0n?=
 =?us-ascii?Q?smW5v6r0aExglAEFIo6TFd6MXUffP7WCkSpZKFLMdeGflLUEpcEOiX/eAaSW?=
 =?us-ascii?Q?4JR32iG8OpwY7U4LaNqFKy7VueFbDtP3RDU9+NbGvb2Qz7GmgU+Edjdz96N2?=
 =?us-ascii?Q?44/+EtMjC21zn/vK+TKlEZ54K6LayjK/qAOh6iiSRUre7VH7UslLC5ajtjHi?=
 =?us-ascii?Q?uwUe8fsvDuiwW425jMRgJX1LT9FBfj1NoKfqRxVr8syVcyNW1UdCJY91/J5D?=
 =?us-ascii?Q?/VWHLonnehaoavwjDScctXOqKUG8kC1dnFHgSugJEos6UcWS0QpzMgD3Egui?=
 =?us-ascii?Q?qn/csUk3IYf4sOX/Ydbg/GKevrsJh1SegGgd8ORU7FC9ZsnIuSCyhxKYJHC7?=
 =?us-ascii?Q?RRfiXG0DEr2hb/dJcL8wkH0a129Ipz8l/AYlpm9x46++2BpP+m03VJaC0his?=
 =?us-ascii?Q?4Hz5fyXBEBaEv9XAsaJp4QMCTwmvwMS8CrMNSpoJKNlVGey2FTL2Y0pm7cXZ?=
 =?us-ascii?Q?BsanzpJfEdXAuTCM+iV/9Rt7kcKSXnCH12tUfn6gUUZn+ubVTzQYc/HOM8F6?=
 =?us-ascii?Q?w7ExPw6hjb2mYU0/H47r1QkduCQid5NJwomum7fsJUiHQPEsY1G5KOszEoY2?=
 =?us-ascii?Q?/yoQ/qqAQw+aVfDLXwaZyaBzPIfvSBvkEmlB+ISmQFhYPyTHLM5twhGRSCtk?=
 =?us-ascii?Q?3F1wG8t9hat5709k+nNYa2Nyi2D4Ay9545WDL7LRcUi2ujb1CE6Yq5IKAAOs?=
 =?us-ascii?Q?f9zYBBp/AF+wMP8/TdKHsAimAYrtR9nSrO69X8nIc5kCs46nVSTmaqzUekAG?=
 =?us-ascii?Q?GWj/M3tjHml9q/78DbogQ4R+qVydVwfEurwqcIp6zKCDmfAgbfHpAMN8Ywhf?=
 =?us-ascii?Q?scYUU/hRaJGh3u0CCN2ImRuYEuMoFxzi9dEYD2LftKnzmiiaJ8LnJ6xPVQAI?=
 =?us-ascii?Q?5OIJxOej+DKK2Yle0L7Ql40h46hQm9oY/z92Lki+xS2f0R99Vh0Fs7EyTROP?=
 =?us-ascii?Q?eTl5Npv7NARpLVyFfFz7Mo1U/woiQ0IqKJ0f1wq46CiMkS0JfhtMpvesjZRZ?=
 =?us-ascii?Q?wTg2Be/gF85oRjywR9v819M0TX0nC60SkySf/7pYbFWgR63Omdfb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5dce4b-d035-4102-2308-08df13471725
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:33:36.3587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOihXqQopZcNqHsGXV7a2OVDaaSrnimP9+CvYIfOE6He+4Mj8LmExiLwUbdRA36JPe1HHkS9i6CEgkwN7XxFVvTuwHAsGFp/7U+lj89Y3XKi0NR7GsDFvp7BrLRLbajr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679

On Mon, Sep 07, 2026 at 04:17:43PM +0100, Pawel Zalewski wrote:
> Use a named initializer for the acpi_device_id fields which makes the code
> more readable and consistent with how lists are initialized in the rest of
> the kernel code base.
>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/dw/platform.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> index c63fa52036d7f..5c1c97eb28a4a 100644
> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -141,14 +141,14 @@ MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
>
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id dw_dma_acpi_id_table[] = {
> -	{ "INTL9C60", (kernel_ulong_t)&dw_dma_chip_pdata },
> -	{ "80862286", (kernel_ulong_t)&dw_dma_chip_pdata },
> -	{ "808622C0", (kernel_ulong_t)&dw_dma_chip_pdata },
> +	{ .id = "INTL9C60", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
> +	{ .id = "80862286", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
> +	{ .id = "808622C0", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
>
>  	/* Elkhart Lake iDMA 32-bit (PSE DMA) */
> -	{ "80864BB4", (kernel_ulong_t)&xbar_chip_pdata },
> -	{ "80864BB5", (kernel_ulong_t)&xbar_chip_pdata },
> -	{ "80864BB6", (kernel_ulong_t)&xbar_chip_pdata },
> +	{ .id = "80864BB4", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
> +	{ .id = "80864BB5", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
> +	{ .id = "80864BB6", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
>
>  	{ }
>  };
>
> --
> 2.43.0
>

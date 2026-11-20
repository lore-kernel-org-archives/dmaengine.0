Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192687;
	b=G0822f9YF2PRcT9L942nAYOf9dVaQkV2IvQ7MnYK1nyYMSeO3TKMNmpbwl1twf/PERTQ
	 n+YMKC+g61r9KVmX2MXqvQd0zeZjsnkR3Vmcd2vfkOlxu2FSTlWqsB7Xru+T5YHBEfs98
	 7/m5aePDAcV5XxR7wOBNdyYs/JOV8IlBrYUYhfj2UCAKR3tTfPFsI2JpokFd233KC24uX
	 8GwyF588ZDAaTc2gE3aFKlkCHXnvznAqPseuPKsUR0Mt8o0C/HUCkwOWTi7j2MZDCsAbV
	 +FUAJwstjSHQSWpn22JuauW8uPy6dvAJIyWlJLnME4k5hW1Jg1PSVJUQa1Qv9iLDAQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192687;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/oGLgv2EGjY/057Nhd/tACC3teTCpMDzSsNuVqbdjFg=;
	b=j27vrauepm047iSmUpM2Im6QCBy5BKDuzTCtRwFHjuxM0EIVPsIiymhShBHUnpCDwXLJ
	 YY9z5YwelPCJvxCKbcNpJoQQEr9o/QHD7WwiX7CCeQ2/IoDv2/ABrZAq2xBujUo70iF3s
	 UTjP1yWpFyXFFDhgV5lyS26R8TyMWzLbkok0GwBRTdQhzKd2IwySFnksNI7ocPDHIzt5o
	 tS67JaiAdtS8ssu7DXWM1T19XU/ubrkJudYlE8649OsZ6vzHt5c+n8virQDOaXw3BhvV/
	 sEIIbNW9Od2yi3b0ihSyamgOCmA6j2CVfdSegeYiaKH963dIPC4q8y5oP1NJ8FCMWhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HK5c1d9I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.61
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C4606A33F;
	Fri, 20 Nov 2026 16:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1C4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HK5c1d9I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1Qc6rzadYMXGxMkaR7BXi5xXTAF3asNpYCJgQ5fW4Ba077B9ILJGsylUVxyMLWuKigrlxIjQ5TLw+7HFG2cCUyKzGqk7abneBBUOtVDCiqYno4w7OP5nLNbroNfhiKliVZQ3KwZ/zUaZ1cnh3NRt+dQv+yRa/q9S89ACpBT39gPHuloQ3Za5txgW7p0IczPjZsn4CxTTEAM3l3jk413mnmFYZdW23DMcYAjy1f2g59Y4qh5oWedF6+73k6j23YDgCDBaWJ9vGutIJdByrbwWi1xL2U38CGnA0chi8POly2XnsJk38SeNR3I04VjNVdd1pP2u9VuchqDAA8gRKrUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oGLgv2EGjY/057Nhd/tACC3teTCpMDzSsNuVqbdjFg=;
 b=NsZ2J0O/iVRHhsIZ4fc7j8g9P950RyMTPSEpYlHwuf8rSXcfvj+4uYT7c0BfdsGtyt0p6hBrYKCqf0P7i7j87YNSEmqNH7CyrrJ7ISey7rjuk6PUODku7hb6EsjsA7JwrVQv72I0It018JB2Pl+Ylu3ioZERHWAU9dzODEuSaaT1n2w6uKj8fKCpKtWW0KU3DGN8hIMzU8pNx6l9E8Cwb+H9FKNszxQI1pegeT9rlOxcm2Q0Cp/1KKGntoAdDuMbw7DqQMkvYD0PKJq98Ba6fLSI8za2ZFk3I6fFqPzyvM8Cim9gO9A4MPQkrgF6cEF7SS/cNsgy6NUwFqgLJZ7CVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oGLgv2EGjY/057Nhd/tACC3teTCpMDzSsNuVqbdjFg=;
 b=HK5c1d9IRBUPiHP61VRDzE0PdA1QesWXYTBC49AFaheKGQzH27V6cFq9IzbEKjZK+pp/6dYZgb6O/JllL4mIZq7MeqOKX3lXuam8rAQHVLzyXLaX8DuKgIw0toPmOnjc1mAjZW7w5ZET/UTISHHegekedClMb/ExCiWQal3OHOD0sVyOClCqB2tdlt8h1UTiSW9BCdlIcQ4E6T0ANUn19iwIDquXkI17TAVpBYzNsnY1rl/WXVXCvix9f/Nmv10wzPkcY54t9dfoI+wnmhvQ9g4W/rR3C5pCsLDA0JbGVh/+7oZWoRHHFffSrG8pxdKxkxR1VHgs5rnNRq0eAG/PjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by WA4PR04MB867629.eurprd04.prod.outlook.com (2603:10a6:1d0:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:38:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 16:38:02 +0000
Date: Fri, 20 Nov 2026 10:37:52 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Frank Li <Frank.Li@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v2] dmaengine: dw: Use devm_clk_get_optional_enabled() in
 dw_probe()
Message-ID: <awB3YOGuJO6nZAGx@SMW015318>
References: <4267a49d-89b0-4564-b22b-995de017f52b@web.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4267a49d-89b0-4564-b22b-995de017f52b@web.de>
X-ClientProxiedBy: PH8P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|WA4PR04MB867629:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf93ed8-592c-4e1e-1ca7-08df4724a51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|10067099003|261022075727099003|11063799006|56012099006|261021123027099003|261009223027099003|261102123227099003|261021121427099003|261026121527099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	siwyM1KyReJcJRtqM5LdyFgrLe7Rgh8lE0miqyBiIvdK8QSWfiApUrXPpjnajEPFhehLikC66qQhPRFo7rURF7C3Z5i9Cw0nLh75A4sRUgmOjBOu267UocnksxRIMdtVOZA4xwWpwcioRPHdXGWJ1PEYrQepCzLYuWk7oez1AHrY1R9onFaovaYJMWQYk8gPhdATQjAG7LcUSPkoI0k24ilnOAycMyrO4/z8MoCr8F1cAptdL3I1w6W5Znko5svoZOmpzlk0KX3XMRJJLf5/1+nxopbyFjVbN8unGfJZdWRx0vG5VXVpF8+GOpYjQjVM9bKzQKq0YwMwsj35QjB3n7CdV+ILhKOnfcK+fmdQ10kE++vbOoWywO4bN2VwldKe0iwGMMFU9MKH1JrQpPEVmKQ2H9CEDH6UIwgoLpoYlCzhPOFYZzZuUvXEQbafNyRTmTBN7hREXQilrgfPQCmN5yrGQUcpOPCS1qHp/c0jqiHPeBwGpzQsIjTKWxOtcxkKS0AfVdmcHAujicFkjvJPy3p9O7s84066jT+T758RdnUrm8CUSu2PscSH6NjKOUa6GCpEj/wmviN4F9Efjf1uNJ/5uv1andO4Kf2pZRKtQKH6XS8VE56+QsHatuq3z5dFNfuGCj8oDMEDnQawAbx/t2CRQ8uUE+WKiB31N1QO774=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(10067099003)(261022075727099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261102123227099003)(261021121427099003)(261026121527099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NllySDRMb2JwNzFYb1RGa25mRUgwRVM2T2lONVYyd2JuMnRoNVdSUndpaUNB?=
 =?utf-8?B?OEVadFkxd2drbEJ6OXdBSGV1elhRQWpNSkNISTBRdWluazUzNXMxY1MvTVJI?=
 =?utf-8?B?T1NwUjQzN3hzMUM0dlQ0cDVhUTR4S3RYNVdrM0tqK01XLzNFUHMyUDlqQzNQ?=
 =?utf-8?B?ZG5QT1RNaE1OUjVOYTB5a1NjT1hEdmZSWDVQaEpkTHpzM2FNcHZxdWZqdmdX?=
 =?utf-8?B?amRqT24zRFJ5bGlJTXRyRlhLcDJsS1R6MTJrcmtwMVFMaFVXNlEyZ2tWVms2?=
 =?utf-8?B?S2tMaEZNb2s4cE9xSVVKOHFpalREbEt1bGN5WldrRWdDRDU0bFVxWDF6TzQ3?=
 =?utf-8?B?VmltaFB6Y3FYSnc4ZURxV3NobFA1aVFCZ3dZTFFBbzdUUi92OXA5UnNreGQr?=
 =?utf-8?B?U3dMSVZLL2RmOHZmZTk2M1F5eHc5a1h4Sm11RzZTY1JiR1FESkxXbVVtTHA0?=
 =?utf-8?B?MEFyNHV3UG1JYjFsbG91cllVUWZ5L3d1UzVBMDVNTHlkWE9Wcmk2eTRDKzZ0?=
 =?utf-8?B?WHhQYXF6T1pNU0ZEUkc2eWdLRzViaGVHVFJ1YzRVL2swd3o4OWlQVVpVcDNZ?=
 =?utf-8?B?eHFyWlI4SEpUc1ZBb2M0Z2U4c1VQS1Y3NWd0aEkyam1sNUtaZHp0ZFQyLzcx?=
 =?utf-8?B?QVJ3TUJYTjlkZmtwS3p3azF6MXpSU09jNmVtMldheFEyMzB0NFlZM1Y1WmFt?=
 =?utf-8?B?WVVORm9CSitxVjRIVzRoMjhrc0JkcDhVOUE5eGhIV2hETGRmbDNjQXVYN09w?=
 =?utf-8?B?N3Byd1NiTUIwZ2JQalkrMGN1bURadGxDbHB1VnlhemhobGVlTUZwN2ZiQm1T?=
 =?utf-8?B?WlZSK0RaU21xUEJ0bkdGUDR6Ly9UaEl1d0w2TDh1NkhSc3ZxaEVxZ2JNRzlQ?=
 =?utf-8?B?dzd0ak8vNld1SzI2OWJxOG5aUld3MGx5WG5Ta3hyZExqbkpSUWRRZEN6ZkVU?=
 =?utf-8?B?Z0xRTC8zTmlZODlCbUpBM25Tdm5jSStEdTFwZ3M2eGp0RitpVzJRbnB0TmVR?=
 =?utf-8?B?WEwweEZtVXZXWVJqSEZUWEVWbjUyUFY0TFExVmxUV0JwQjNISkk5bXhBYi9O?=
 =?utf-8?B?YVllN1hBc2pVcTdNUHcrVkFUbWliTmxZNXZxK3BLVXdPQWlMaTJUaDB5Sk9u?=
 =?utf-8?B?OFEzNXRoZG9ZQjVVWityUC9KTUdQaEI2d2MyL2JFdmVDNUlUS3RiK1p1TUlU?=
 =?utf-8?B?MFg3a2VLZ0hTNUpqNHhlSlhySEJQTWR0anpSVDhQdHp1cnYwVVpFWWttRURs?=
 =?utf-8?B?eFQvN1g4emdVa1ZJNWZhZnVSdDZFNFFDeGNCUkNUckNsR1JoQTZwZDdUbXFG?=
 =?utf-8?B?QnB5ZFRueW5pR045c3EyOVlOVjZlVTk1L1NycXdwdDFTRlVkaVNnM2Jkdmht?=
 =?utf-8?B?c3ZHSWowVUFWRTVqU05oSDdhY0s2WVJSSnpjem14R0dkNENnOVp1ZHBWaS9o?=
 =?utf-8?B?UHNXZWU3T2R1VThZUlQ5NVJQcWNuUEhwekZUWEV0bDRpb2RId2V2ZGdKak5p?=
 =?utf-8?B?Z3gvbEJ2UjlQVlBVY29tMU9BL1NRSHRyVk1JSCsvWDdWcFRSeUVldHF6blZQ?=
 =?utf-8?B?WlQ5eEQ2SUZLVFliaDlyQWg0QmRweThHZ0JYQlFYS2dyV01TQ2hTVlljbUhW?=
 =?utf-8?B?S1AzWjl3NkhOaElQamNlcnVRdi9vZXFLSlR5YmllSDAwUlJwczdybEtuUWFx?=
 =?utf-8?B?ZGU1QW0zbXhPdlNlK0pFQkJoMWx4QUcxOHZndHAxeWVCR3NGV0dUaGVHd3J5?=
 =?utf-8?B?bGw5ODJPNGRscWhYczhxbUpOR1ExUWZhTllEQlRyOURHU0ZHMTJyS3Y2OEJY?=
 =?utf-8?B?VEdWZDl4THB6LzFJT3RXM01ieG84MjRSOUs0T25yQmFPWVhtMFI0ZytCb2RB?=
 =?utf-8?B?akk1SS9KeGxZTlFTcUVuUEt5S3plZjVaVDhkVTI4L1MyVGk5WTBxN2dqRmRt?=
 =?utf-8?B?MElXUElqUU9ydHkzMENldWJDcng1c2tLZlJZMlYvUTk5SGkzOHBWMkI1MDlM?=
 =?utf-8?B?QXpld2JkeTZKZ3RBRE9nUVVjV0VUcXZ1blMwNGpNQk5IOHFQOFNLUHdiWkth?=
 =?utf-8?B?azVMQUZpays5S2NVWUxESkpyZGxTSFplSjRSaG51MDFXQzJFeUk1RlVSZCsx?=
 =?utf-8?B?R2JuMXpkY1REWHVwUzdDUUxidW14ZTNOT2dVWXVQYUJudU1Lc3dHc1REK0x3?=
 =?utf-8?B?S0E2YmFueVJaTFNKbk5PcE9SVDAwRERMV21WVkxMTWJhL2UvOHUraGt5a1U0?=
 =?utf-8?B?bUhiaWZhQm1qbEU4bnRtL0Nvb3RDNXRBRCs1SXY3M3lFdURBZmp2VkhiS2d3?=
 =?utf-8?B?VFhmQWhyL1oxTVY0L3Q0dEVoakhSNnQ1VllmSEVFNkd4djAvZ1JLREs5R0VZ?=
 =?utf-8?Q?abxhEkGGEXDdx63ay9qFFJu2bBfSUmfO3ytEW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf93ed8-592c-4e1e-1ca7-08df4724a51a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:38:02.6496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpfPfFtg4A7oul2IIJPuDpSm9UwnwLW4SjkwKu6DwZooN5CfKNDcheETHTGagvgaGR/ewa8OBHhx/YpaFcwbAsdTO2t+mafthQ6vLmcV9a56574J4GVA1j0FvFw4G7TP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR04MB867629

On Fri, Nov 20, 2026 at 03:13:01PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 20 Nov 2026 14:23:13 +0100

Any tools issue ? your patch look strange. Why this information at body

>
> * Reuse existing functionality from devm_clk_get_optional_enabled()
>   instead of keeping duplicate source code.

Needn't *

>
> * Omit a clk_disable_unprepare() call on an error handling path
>   and in the implementation of the function “dw_remove”.

Clean up disable_unprepare() at error handling patch and dw_remove()

Frank

>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>
> V2:
> Andy Shevchenko and Frank Li requested further adjustments according to
> the proposed changes.
>
>
>  drivers/dma/dw/platform.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> index 7e76391475ac..13c44ee5e047 100644
> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -64,12 +64,9 @@ static int dw_probe(struct platform_device *pdev)
>
>  	data->chip = chip;
>
> -	chip->clk = devm_clk_get_optional(chip->dev, "hclk");
> +	chip->clk = devm_clk_get_optional_enabled(chip->dev, "hclk");
>  	if (IS_ERR(chip->clk))
>  		return PTR_ERR(chip->clk);
> -	ret = clk_prepare_enable(chip->clk);
> -	if (ret)
> -		return ret;
>
>  	pm_runtime_enable(&pdev->dev);
>
> @@ -87,7 +84,6 @@ static int dw_probe(struct platform_device *pdev)
>
>  err_dw_dma_probe:
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(chip->clk);
>  	return ret;
>  }
>
> @@ -106,7 +102,6 @@ static void dw_remove(struct platform_device *pdev)
>  		dev_warn(chip->dev, "can't remove device properly: %d\n", ret);
>
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(chip->clk);
>  }
>
>  static void dw_shutdown(struct platform_device *pdev)
> --
> 2.56.1
>

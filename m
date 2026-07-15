Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021099.outbound.protection.outlook.com [40.107.74.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020FE2FDC57;
	Wed, 15 Jul 2026 17:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138269; cv=fail; b=ps5GVwQc4HROZAaCDr1qMNZtOSS9BLuD8dwgWcGjt51o/nOk7+T/5dp26ZJetyaYL9M9g3SwaMgArjVUvSe2Y3SZhGt9WNGTCE3y2X4HvmKjaZIyu4FlWHCXlI4ZsJpcSFFxNIyxjtkWggG3MaeSRJ/1HojtWymoObAkfQQvwWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138269; c=relaxed/simple;
	bh=UxqaHxY4oyoAhGB+h30UsuQY9ujTPFez9Hr1O4tBaPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lqyXq+FlRYuIZgTtHsOA6a2kzmMcsuCcUffqdEXkLTxEQOJV2PT2hYyftNmMWkFaUxjKUBEpmSDVonmOm/hSdPsrem/dHMvEC3Zh+HAqxXUIcmhNtafj5Zm/+pk9cg6R/8poYe0zz0x5UsIT5MHRJmrONB460/YBtcWVLJRhFfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=P10HXEDm; arc=fail smtp.client-ip=40.107.74.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="P10HXEDm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtxlW+XqPWsSQVcpjGsDGyIEw+CaMCDg9+cSoTl+Rn4zzASpESKNESPBY1/HH2wLcifN2Sy7zmqcGR9LBs2FlEVWAXAwGooD4qua2RgjOC+/7xNGxLuyi7FrC0HajWMNXYJdl8F9ozOVYm5gxQmVFWIXgJ8IhJ3PFPrVmXf8ldm9oUEXRUn7oY5yNRHYn6pUztOFPNI70Q5opVSXzvoS/lhr/RXvHj5+GDBhg1C8pSHuhWGJZV9BT7fhYpixyaFRzgcL6PHTXPdz61Q1su6xsjhhtz/PSgnzKt+8P1Q4t6yXGsxF7G/qFSClFhuESqCm9ZXCeYGLVPeJSY6r0r8m3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmIUNrhLAZk2W5yxnMslRzZC9yBajRHcyuMBTOfE9Gc=;
 b=SQdcoH/UNT/xyDT94g6lbzXroc7lkkKBfr1wmNaNS9LiABC281bkg5vBLSfFRSDr9h4A/EZd4eJIo6+OQh5j1cUt9uVggTfqG3PRo/MezSX0ulme07mNXq4opSIq1u3x/1k3TfXkVYOf7rxQOm5BnSBfS1Z4rfYWvrzHqqTduC6RBKq5Yzz2gW5P5mTMxnhzx5uPYs50VO52d4mthjNiygUW/qT9Z5DnKIDcd7AW0CZkrPudmoSX4A6JSwS8k6Vk8iWK2XqPtOwhIRNpBxaGU7Uf8c2kFSjfmrs1c7SSEQ+SnpdMxlrLiJXZ4mohJWp4LZkrTzD/uDAPYGByfpCH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmIUNrhLAZk2W5yxnMslRzZC9yBajRHcyuMBTOfE9Gc=;
 b=P10HXEDmWQprHwdpuc99GWRPtCMi0Ouno12JYe/HufhbW9botm7mj1LsjdqSjMs6gf+vbBgrwFrjH8HY06DFLRbvN77xeXDvC7QK/zYz+3/hWRofhLwc56qf2tScEmlG7o/yd8WVOwD976FDWdNQoiXOwOTR7fgymEiUqObHpRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4406.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:57:44 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 17:57:44 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] dmaengine: dw-edma: Fix HDMA channel status register access
Date: Thu, 16 Jul 2026 02:57:32 +0900
Message-ID: <20260715175740.1110404-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715175740.1110404-1-den@valinux.co.jp>
References: <20260715175740.1110404-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0090.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4406:EE_
X-MS-Office365-Filtering-Correlation-Id: a531a0e1-0672-4a10-33de-08dee29a923b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jrKF3TcVK0fxNfon0Ok+XcHUC+DyG1Qqt8rIrm7S5vKuO+JH2JoIrp9WXhevgOZE0BszNaENuVq430EXsrBpsZSbVFhwzfM4PAQNa1jhlSbKlYUoWBC3Jm2XDKJ41MRf/GPU1Ut8xptB1ue7fhNfSNN+crE2kma5C+DRv06Tb2oAa30oNhKKRDCXZ8T42aiytUfmNoBGEYe7GwoBlEFIsjXUgHAjN33sLGlgAMR9R1PBZTwN1mcHcjUCFft/2MUIFTO/rX+0sJVE0fvzOLpR2KHFmPaG49lnendCdL/dsmzDjSkWnwh/SY+Lb1ZjzBKBzn4u9Ts7dlqXCNFVPaTh6h7rr85ilZ2UkMmUVkcgYmXU5cGtfmVXiqC6voyYZPJ0p+rO4Gs/DwjhzgyOVAB724VNMJ8RG7NFURK07QIfMn3DOMQ9coiotWCLK1E8WfBD3Y6F2gazwG0WJtZkS1+0BDqOoQMFqOsS02CTQdkwtqyN+WkgbhnRG7qJgD6QmWRyYSo0BYXRq2zDmLvDgp1Or3UnvnBGQMl1m12pJrkj/uGCz718i2Wq6J2B5m/O4ORZGkarJjLctulaGtFlLm83IkE31ZDctGN3LAR5v1CC5mc63Z80OBJZNbSFFr7ALSHya74690yTlMCs8QQ3xslrIZ7E07AHB6izPeHRtjH02r0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K0lrGGaMQJJh8Z/A6O5SYSO8Lhz09ioZ/xlWE23BZGYQDtfXhq04FOY3EjKH?=
 =?us-ascii?Q?t0bgYcJ7zERtZz9/B1eTzs5G0bw2XKgv9Vwg5LjopalLBhGZ304IPTer42pB?=
 =?us-ascii?Q?W6xp+SQ2E+7zKcvQB7xC+gnOVKKXXUcAawHZ6CeXlyWFIFGQXCASzlogtZz4?=
 =?us-ascii?Q?JtHq67LiuREgoiJ8zm4Ozec+a1efOcICbFFzJ8zh2z8XfMOHb5/xPtC8Le8B?=
 =?us-ascii?Q?7lP8hrEYyJA5mo/Sl+vf7sicT8E2Y2rVRJHdlURECUqrNi15HpsfRLhxGi80?=
 =?us-ascii?Q?c6P9LjedC18t+B7OU355IsxADPE+vNGQDvdNYpjP7MFKsDPaZzB7thhGGuC2?=
 =?us-ascii?Q?JfUQ6P6Jhdzg2Jj+ZnBpkhCIw8+iByA1Zgh2b2Ibc+ZZ/i68VXkrP3kcmB9J?=
 =?us-ascii?Q?i7dy7tTNpnQICQ+5zfdHzb7hjenOhMSIo5Nutk7GRvB3XxS44d6rKJgBRG6+?=
 =?us-ascii?Q?FN4W4TFR4Yak9iHqzRg9XhDpeWPe1JbCW8c94vMPJJCcK1Dqqw99ej6J8GBR?=
 =?us-ascii?Q?h2eDvgpsjJYdDM/1bqtiqZlnxMbZaECpIcvd3b0qf18MbkhEQuQUIVEDO31H?=
 =?us-ascii?Q?1OMoNE/k7lwRJRMHi9C2a5I98kNnTTqIy1HyAdZJeOrIYkC1+kOlEM81Rb/n?=
 =?us-ascii?Q?IiJKuB+MeZNb8bE3/MXPZATx97JsjKLs5OsgYXr5AzHlsqMJpGVse/WxJYOU?=
 =?us-ascii?Q?DhidzsgL/CHaVDrhiDIoHa/V9B9/ecS4sjyg0c5Cl34YxFxWiyfogPa0Sxr8?=
 =?us-ascii?Q?2rPMhbEdPGfKjuot771RZYE9fJEavHJZrENNupoIEZipIl5hbbcXnf9bEgon?=
 =?us-ascii?Q?XuuX+KtcoS7VpV6xKKaK6VPvnOn1ck42aWfVaEbXsWX62VxOUd8uX0CYyqPU?=
 =?us-ascii?Q?5OqTyr+oIy66OsgYnjRSv9rOj8VmUJbvVERkZWPz0cWhHt5eWZzpHAIFYEq8?=
 =?us-ascii?Q?YWABq/o2sHKvO1AKPaLNfkja1XXC2K2Y2ji066A3ynl/jvv8WT/My/LSTCv6?=
 =?us-ascii?Q?CDgR3zs1FMsse6lZN9OvXm6LECDh+9EuqrD0+dRNQ1bR/67nMNhfhZk7hgnU?=
 =?us-ascii?Q?So7yW/X6VrCKKpV68KP6GImRNPPdukhOs9G2hi1pRRa3goOHS72SgvoksM7u?=
 =?us-ascii?Q?PBjK1hlEQHy1u2fMuuIrxWDsSRhcIQqk9KxyHieBmp/R+UFJ+j4czBuhDs/u?=
 =?us-ascii?Q?vG7iuv/CPCPguRPT2Obf8S2HM6XZgylRxWMrZ3OLMxDkXOmwtlT5i7XKUULO?=
 =?us-ascii?Q?CljKaKCLdUASbhOOJj2g8QNZ0tjhj8GKhNW/Tl/2pZL3Z35AFS2n28A/d3cE?=
 =?us-ascii?Q?oLEPOMVewQsjqKNO0napgz950BovVu7gxdVIWgWhScgiPJyUuQtppgQz/k38?=
 =?us-ascii?Q?Ix3MbGxs3bWfdG7RmaopMoTW6xQbzdmJDUljZ8tvcBedbkz43GiZ5cLFlAIb?=
 =?us-ascii?Q?iabEi3CYrqx8Lm5I4D8SAuxvxzFgVysSFV7zVUE7FdUYWZEMLSRUhKO7kE3a?=
 =?us-ascii?Q?d4nAiX3B11rUGIj9Ft5rHcso+lmFPDNariP0eD6FecUBsLnSMf8eVLLNhOLm?=
 =?us-ascii?Q?xYnlLz57msLt09L0+G3qnG32n4lB2NEQtNclsQkixXoeL/wZfF82M6RU9Q3b?=
 =?us-ascii?Q?Tx0fpkROL6rWbCqi7VfXDMHEe38Vx7VyQBLs98fT7sgveoCaur2DajUyVpMD?=
 =?us-ascii?Q?CMxUJDX2Q2FJy5tUpCDGYAtO3FQzTxAWXdmmF5cKkmoq5zGHGKpSfjx7eXvX?=
 =?us-ascii?Q?HC2eZ/mswdVM0PKlGMBhkLl/XMCOmIE35B4y9GDXdzTbG1XqwoOy?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a531a0e1-0672-4a10-33de-08dee29a923b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:57:43.9849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyGa816KO6lXpSURrePd24kOqyV5mBt2xt2z/3Rd+jnw+XAhWRN0teRcbMYrknlyR+tzWZ1X18k+qaeQDbNkqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4406

GET_CH_32() takes the direction before the channel ID, but
dw_hdma_v0_core_ch_status() passed them in the opposite order. This can
make the status callback read another HDMA channel status register.

Use the same argument order as the other HDMA register accesses.

Fixes: e74c39573d35 ("dmaengine: dw-edma: Add support for native HDMA")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - No changes.

 drivers/dma/dw-edma/dw-hdma-v0-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 632abb8b481c..2beec876b184 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -79,7 +79,7 @@ static enum dma_status dw_hdma_v0_core_ch_status(struct dw_edma_chan *chan)
 	u32 tmp;
 
 	tmp = FIELD_GET(HDMA_V0_CH_STATUS_MASK,
-			GET_CH_32(dw, chan->id, chan->dir, ch_stat));
+			GET_CH_32(dw, chan->dir, chan->id, ch_stat));
 
 	if (tmp == 1)
 		return DMA_IN_PROGRESS;
-- 
2.51.0


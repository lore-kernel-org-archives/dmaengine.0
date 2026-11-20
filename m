Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795166303;
	b=qh7RAb7F+gGiwTV+IwlIJvbStySnO+sn7txVdU9R7qG/1oQZYpTUidaVx3wNBDqnPheO
	 tvX/tw7tQ2O3CI5giySSEkDeYRfYFd1xJuLOy7b1jZTgdLVuytqSDg4m02qY+Y+xUjOLU
	 Ar/J5coJx/e9bHVtqHWtgGHt2JiXFUdJKH6QjLZyPyQ5zHTfskBFfdTemTRwjR4Ga/kA/
	 a/SaA2FY6o76q19p7CxGEvvDbc2X5oGwfkSF6svp645ZrO7s5qvpufJBehQEP6ODk1zak
	 UqElyB4MXpHIF0VVUAGYcz067E8xzXM7228i1MSxoSlSCnCvs5UAO5q8mVYSry94BYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166303;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xeHV1QIUGlXiCzRxx+wOZyYTwMb5C1vRGJ7PnaOI2Ww=;
	b=s7b4bDVtXFOkwO67df9yRU8dl9JxWNqev/g+mWyCX/0zKMEm+Y0DgnabBerBQ3sOT/AS
	 wRngT2PKnffBYhzT8m6GUmmruL56xOA3FIp+stpUpoCSGHpmvldPcjsZggDZOkUCGZ/Xz
	 Rsd5ASEmSSgVAFBz1JDOf/7eLBcWyMWAMg066jRkJxpu1fP1eDEN4nK76h1+00ZYVh3dv
	 vDBpMCeaa9JOOhShN5ebXru34KpvscW4LrP3GIGC4Ug5qxAgl7nUGBNT2aYfc9Zem1AQ0
	 ERKQJGmXHK97RUaXnwy7Ivaz0/ryS8cGZgSP1xXqTC3WH/NDRpX/DrCZssYhZF+yLzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=C0xFYtEe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.25
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011025.outbound.protection.outlook.com [52.101.70.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8258606A334;
	Fri, 20 Nov 2026 09:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8258606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=C0xFYtEe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9jwYqC8dPYtPS3goGhWWreOyX6+Kz+Om0NSjJ+sECEr8TY9W4Jjf5WAOmFg/m2tIRGb6TEM4FqnTYpeIXQTCOCgPPlcjQ0QpQLXMSQzRYM4k2jKsMOb0+EfcIbazrzRMFJga/l3VUZ69qWFtC6VYrNiyQnYzug3UcOjENwnc/nuCEHX2ImNQxUF0d4Oixd0iL6eanTED8xRT0pNmnisj3BUYSN27mfqKWjRHYM5QkmyVjMrPi6oYVYmNZPrs7fd0ZqAiC+jC+UO01WfzjN5xnX6SopwHJovAhONcCauX4/Ckx/jYDolCajCtsEoAF9WyW6WB9CnJOHmnzsg643Xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeHV1QIUGlXiCzRxx+wOZyYTwMb5C1vRGJ7PnaOI2Ww=;
 b=gBGxS+WToI73S/8GYsWb8x4BkPLlW0fW1E77ahJnJOL+tlWlYDs0HhcOSTLnUjzkI0+4Q8QYhYe9XrWVr16AthjhnUEdNSbN3wj6ihvdYVinVWn7yQfjPf74kKkJr4Q7OAN7Zl4T9+j+eWcNMyr6U8YXgmQtjQmHXe4vNTdahj7WF5VT2uW+LGPy8MoLe348TpiADpWJVvH5tlRgQ13N+CRiEOAvz9/vXb6fwu8SzWDjHyoo3FfVXx/quncu2aUlTe6zFguPgaiNHL5vsYPOcH5A+l1IigxycLJKyeZDm5JQefjUKay+D32dpj7LY/dvO2zFmZRfDRbeL1V2tDK+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeHV1QIUGlXiCzRxx+wOZyYTwMb5C1vRGJ7PnaOI2Ww=;
 b=C0xFYtEeCvvB7b+HQNu6nvUbLB+dR4cTAESocLqud9HXquzgnYXL73TInTqrvwRnyfxB5FcfOsCDbZ7eQem9rMFPOqcMQCXvus8BaVGlvd+oir9fUBmCc+07Er9seLw4C0tT48G3udhcbH5CxqtQKhE8VhD04W+QrQTUeLZn4rWH9dP96+5YjASwqy2KYu016VkoF9j4eVR4+Z+gqpnVbULio1WpLx1uD8HsAief0FY4eYQGVqnDcOMKX+negzsYVzo/5CLd8M4DcszzrWrJUaamV+/1zU3P/7q4puFOkhb203yzCOI0uwSgqklruAVujD3JT8/Xpq11QmFjMsXNrw==
Received: from AS8P250CA0002.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::7)
 by GV2PR10MB6209.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:76::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 09:18:15 +0000
Received: from AM7PEPF00000053.EURPRD83.prod.outlook.com
 (2603:10a6:20b:330:cafe::61) by AS8P250CA0002.outlook.office365.com
 (2603:10a6:20b:330::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 09:18:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM7PEPF00000053.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Fri, 20 Nov 2026 09:18:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 10:18:55 +0100
Received: from localhost (10.48.87.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 20 Nov
 2026 10:18:08 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 20 Nov 2026 10:18:04 +0100
Subject: [PATCH 4/4] dmaengine: stm32-dma3: replace hardcoded LLI size with
 aligned descriptor size
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261120-dma3-fixes-v1-4-f29c1f437399@foss.st.com>
References: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
In-Reply-To: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <dmaengine@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000053:EE_|GV2PR10MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb527bc-b052-4360-5eb8-08df46e733f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|22082099003|18002099003|261009223027099003|261022075727099003|261021123027099003|261021121427099003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	apbWO7OBMQImlwK4QNhg3znDbvUIYfXJKpZl/YsOOH06QHRe3WzKKyQXQMua221plu8ZbGoX127w4RMSA6WufOT3tRD5/rMPlAfhXL/yLIw4RmqYUhnTOx8sVzVYu6+blVoN38jXSoegMNOrr7zvZ+d2ul73TujqfSmw+tz0KyQfYfGZmGo1HYXmTqcT/E9Yb6MaBndkaJmDVO2u+YOmkQM1Z5XBCjEWpnomOTyyjn8mg1MlnlgH8wwwb1Bbb4/tdmL9S9otJKhx36uFl3FJTScJ0clf+9iP6XrhEJtwShkyhe8Rp+uJAwwFDnzgVGtUCVmEjAITzIt6TM8hN5PXSJdCgMgpzEMu6p/F7uJDonCuMvge81uV3Mwz5aAvI34BdFgs8b4EPxOiMkEXK8RTbhICcy/umLKTKo8UtsiytkIcyP/RmqQ7pRH4Micq9PZ05H83yvc74TAZtmblBd+NyswZ52bkT1PCD4JHW17e100vdPmZC+JL+uEmzKJdDYmQj4bkeplgX/1FtdBS3FogJGCMyAteSO1/prPmbyo/jw2/ZNd+ekOLzLXqkGpAFCRQGwjSxQ+PspUyDvqj4RPA8VMFrS1yKeqnypxYe+Ach6Uz3FEGsXSqjCBohz9DIwiSnfFa1EeXgOPvZjBxp1z3l3N0aZPi5RojTAZHVn8Yj1dOWRh9FFBTQGWD7osV7iF7Hl5KXlxctw1T9xfEkrrQdg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(261022075727099003)(261021123027099003)(261021121427099003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ha3ZxBpuNItxv72fL9blQiVGMhLW5mKhz4azBkGlbxUko8zL0t75SXGVBCAVfx0TMiOXyz0CCWJlNi24c52Hp71eN8FgFqyjIdyRpr+1Mo8NPTtyRI+yMbhKLPmPzqF9+hbGVJJK6X3z5GqyQJXXuYKEZKiYT57ZSvZ2xRRq3ze08oFjLyEea6+go/EW3FTBGZRV9VPDch+alkLq7a7g455zYNl6rdBv8Mjt+8+5imDFVHU8fnaZePdkreISXSUYqMlbh57F0+cAkQ0Pes77tHNB+92af/FY23JvEh2sRgl+YyDZab/SWU+31hYr5r5vIBg+jPi2rtJQF6xAqWh21d5cxZ0saRQkqx2ZJ9yIPvTAw2FnNyP8u5Zovyb/Vz5Zi2xHiYIoMDf2NfGQxSaXNn3Iia8Ja3QEXh4HOwUiEzVjUNOoRb0hiGTJQUx8OWyo
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:18:13.2474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb527bc-b052-4360-5eb8-08df46e733f9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000053.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6209

The DMA3 driver currently hardcodes a 32-byte descriptor size when
computing the maximum linked-list size and validating the number of
descriptors to allocate.

Compute the descriptor size from the aligned size of
struct stm32_dma3_hwdesc, introduce a dedicated STM32_DMA3_MAX_DESC_COUNT
macro, and use it both for the segment size limit (STM32_DMA3_MAX_SEG_SIZE)
and for the descriptor count check (in stm32_dma3_chan_desc_alloc()).

This also corrects the maximum descriptor count: CLLR_LA holds the offset
to the next descriptor, so for a descriptor size of N bytes the last
valid descriptor is at offset (count - 1) * N, and the maximum number of
descriptors is (CLLR_LA / N) + 1.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32/stm32-dma3.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 7c509a69f5e5..e5724c4b2c84 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -251,12 +251,14 @@ struct stm32_dma3_hwdesc {
 } __packed __aligned(32);
 
 /*
- * CLLR_LA / sizeof(struct stm32_dma3_hwdesc) represents the number of hdwdesc that can be addressed
- * by the pointer to the next linked-list data structure. The __aligned forces the 32-byte
- * alignment. So use hardcoded 32. Multiplied by the max block size of each item, it represents
- * the sg size limitation.
+ * (CLLR_LA / STM32_DMA3_DESC_SIZE) + 1 represents the number of hwdesc that can be addressed
+ * by the pointer to the next linked-list data structure.
+ * Multiplied by the max block size of each item, it represents the sg size limitation.
  */
-#define STM32_DMA3_MAX_SEG_SIZE		((CLLR_LA / 32) * STM32_DMA3_MAX_BLOCK_SIZE)
+#define STM32_DMA3_DESC_SIZE		ALIGN(sizeof(struct stm32_dma3_hwdesc), \
+					      __alignof__(struct stm32_dma3_hwdesc))
+#define STM32_DMA3_MAX_DESC_COUNT	((CLLR_LA / STM32_DMA3_DESC_SIZE) + 1)
+#define STM32_DMA3_MAX_SEG_SIZE		(STM32_DMA3_MAX_DESC_COUNT * STM32_DMA3_MAX_BLOCK_SIZE)
 
 /*
  * Linked-list items
@@ -401,11 +403,10 @@ static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_ch
 	dma_addr_t base_addr = 0;
 
 	/*
-	 * If the memory to be allocated for the number of hwdesc (6 u32 members but 32-bytes
-	 * aligned) is greater than the maximum address of CLLR_LA, then the last items can't be
-	 * addressed, so abort the allocation.
+	 * If the memory to be allocated for the number of hwdesc is greater than the maximum
+	 * addressable by CLLR_LA, then the last items can't be addressed, so abort the allocation.
 	 */
-	if ((count * 32) > CLLR_LA) {
+	if (count > STM32_DMA3_MAX_DESC_COUNT) {
 		dev_err(vchan_chan_dev(&chan->vchan), "Transfer is too big (> %luB)\n", STM32_DMA3_MAX_SEG_SIZE);
 		return NULL;
 	}

-- 
2.43.0


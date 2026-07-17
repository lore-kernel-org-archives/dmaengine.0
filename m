Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020123.outbound.protection.outlook.com [52.101.229.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2171A37D11F;
	Fri, 17 Jul 2026 18:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311609; cv=fail; b=uCjmaCg4eW1FgFJ2ciANYWAAj1s9JkfLw3BfqLZH2qBD9dqYvZU9myfMoyRTpP0xI1+V0aTmLwhZVvBZPTyIvRMtQDoJWdC+fZNq8HQQrts/960WFESu1fuPho/1BtiEWHeVPDAPzPuOFUe3hdrZjgAAYIUmczamFQYKZYQIzIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311609; c=relaxed/simple;
	bh=t16GeGcx55ujFXJNFKj1ujJHV/FZ5Uli5PfwEnBxtk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TaJuEFZHEhKgDHkULNaHb3sOp//v2SOeNyBWEZXla6rpC8QxhwWBqPGyunu8g6pv1yDmOSlzFQoAs8t98uPpPpwGKr4Siwk6I2yQYK//xjXqqcRNZizc6GKZ9Wwa21ozc3uiAw+UNwI1GXkkdv2HWo0dETeiU82FyCK6ejhCAX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=wGe0BGbU; arc=fail smtp.client-ip=52.101.229.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="wGe0BGbU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZRslEGFROF6ylGCgtuqzeFTD+Ck1qRUlo5GLoTIx87IaHbrFF7tHdMgnM0iPxOCBxS89LP042FpAwUbr0T3abrVEzXBQhY8fdwvUUvzw+Wkd6Y0hHXiJw2KbNu1rajvVdb3RKOQzzIs+ELz7uRnfXjz+dKXZ1kc4FX86rb5TbS+AszdvFlibMRc0cQdQV5GzdIgrBVsx71v8Pwd0qRzTtDNjzarBDyVzjm10ITxwjSQulsaxj+TH9Hg7V24/kW3KtkdlK7+YOz8Njun1RPkA/q83kvmaxhQtgC4BTl+rqSg80xFyXzs5JDCJXOMR4jUQcfzhkxi5zv474/0nJYNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6S0DqDdv31B63hzWQd1nPKPyTIO9vo66q5xhJGsVM8=;
 b=iMeR9MqtqIXZu6lH1QH9aR/7BJ0/zxcxeSsfZq9Dv8qlWmCSLVDKR/cZgflwzxAh1h1HCmsO0A5wokjgwEwEoB3egYatnaSmpDDzFv/o2waMg5WUX+xTUGfTmYArurFENnCxvvL16UC1bBh37dvfexn3fhEX6xVAkZ1DfY+ezGryYK97kQuNEgL78OSEZkmjaK2RINE2VIVL6Xxq+ykT7Yhk32d7PawEnTnS1+khrx3swK844s9pvwff0Pjd1YFxgcv9T+LN1vcInfatjvkRpqos8YrRuwJMW0qVjnlWh9WtlKmhaebtmMk6S9UZYB7ZuFHjWmomTFske9ybkQfgQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6S0DqDdv31B63hzWQd1nPKPyTIO9vo66q5xhJGsVM8=;
 b=wGe0BGbUepszu/u3HB+KySKEVulykFnphowCSmTkYrSNe6seiu+XFP8FZkMgjeUWwW/vfjulMXl4sUJFaCoSgJcmXjuFZj2kZ/+LMeLFn124YQ3qK3b9Ff8uIB2NFncKCyed79iqSy1vSBIGwIxad+hb2zrApZ7wtUX7L1ng7mE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6260.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:327::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 18:06:43 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 18:06:43 +0000
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
Subject: [PATCH v5 1/9] dmaengine: dw-edma: Fix HDMA channel status register access
Date: Sat, 18 Jul 2026 03:06:31 +0900
Message-ID: <20260717180639.2643243-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717180639.2643243-1-den@valinux.co.jp>
References: <20260717180639.2643243-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b8b684-80ea-46f9-2f62-08dee42e28ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DAK8YrWKYKOaZf4IFB0jV4H3YPAHAxgZIHGUhbgzFGYhKuqd/LjXbsWpmP45B4b9e1v+31aOhSM724q5vvVcI/ZyMPu/mX/dN9/7t5PyIL3mYxd+T+t+7HFHVyBXjo+EKjbsSmfgFtFxB1ayC5jTpiVuq3l1j8fktjeDpPblTNl44k2d7FaPBWH2NX8oblT75NofGDQ1E7q5RnP/dfMZe6V07CsCbiagEiq4qlJjlNt08flEe3STtDK4i5TWEP/Ga8JDexAxFIG9tHQuiIpcoI5Beall9zH5PNLI9zD4uFQblJGeOHzYN0TxbyXZx4Q3gpfptg+UR1K4Ay7nvoyWziDrq2PYNlhzNUWHiWA8OiysBWn8ETGseFQHulrFBQAfY/7O8AMtz7En/JPzA88fwuQJmTPUsUNudmnakxL7JW4s5LZ1YpJXnn1K7lb3l/byNnxsF4gJwCCjlBrl70o6+a5ZMevoIxcDVmztRSg46Ftcm2wwtpSYJ29eEUxvUzt2CNw3vGAHArCO5m2hWGc/p1+CGn56tRt2DSVXijtIQlbICSJDZbeQgX97FbK1+2jN+9mLiQE1uaCVRWQ+JjVy00ivKzYFmiREnvEgG4CUyN1lidSrsUEfOg0OvYZNV9vlIN2LZI7vVzeNSgxUK/h9Cnbui1nghmoe/RM37oYzy3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uEyYFUd+ZsJvCsBBjFGObUPWlmBqIDRANQ0mZj6mVSYkCEtr7rYrDBfiKIhX?=
 =?us-ascii?Q?ntj08oDITGAgcuDsR/5dHR2UFFRCvtlXjrZBSgqwE0u6T/95K59Vr+BXlNpL?=
 =?us-ascii?Q?vFT/1Jh0wWJ+dhzf1XMl0oarNrFWRN23vDYmfrFbBCtgWSocBQB5+0kkTuDk?=
 =?us-ascii?Q?ykPKSncD2mKta25iZ4/O4s306n1figlO4kI6eL8T2O354aA0JnV3I/1/DDsk?=
 =?us-ascii?Q?Tj8UWutXwb6IdZ/1XkGKV6JtP/rZtv7RSopCeNmPIjrArpf4BdGFk09NCkyl?=
 =?us-ascii?Q?i1aC2yAkAfEYsWErAxJzEFEW5ZsjVJMmGf1ZvGPeGuFK82Dr9H1NYbs4VQS7?=
 =?us-ascii?Q?8xwKUEeqtSf9hdylp/CO0ZezLapwI+qt1KaVC1HgA2VcjZhrj0czGhSqxORz?=
 =?us-ascii?Q?t/pY/lMGysAmXSG4yvuJgi5ae8vONZd4x/uQp3TtIQiOFw7tgdPbW71dw0O1?=
 =?us-ascii?Q?v0ZBwsDYKxddB8y1Ou/qWrQxGcrAltXxkGSqnsFCGgsbJcvGI2ecvl/faqL5?=
 =?us-ascii?Q?g3NGrpC/jK+ff9R0x2cdFi7l3PSQoPFYJvunup4xCWkiupFWOyiLFD2qbaAs?=
 =?us-ascii?Q?OPaSoU28pC1UxzN3ZnStlOEf5zmdUcT/DClbbilz3wTHrOqEAAZeVHACPHPC?=
 =?us-ascii?Q?v+/+CSSOTz+1oUFsK0FQ6efj5mxIqHY+f9RokXDPEPraVUYJTx5YFxal3M2j?=
 =?us-ascii?Q?fsKC+Wgsp48NSvrV7Yo7rEb+xA4XN7nOLmDarGVasM9iao71xO5q37e5lCur?=
 =?us-ascii?Q?DZfhR7p9e3jjPy8idPQIBcMs7MSa87STSz9xvksY3HpKja/rRD6EHosTRefn?=
 =?us-ascii?Q?d91cD/fq2H1iVHMxZ60LyGk+9ky4cqzA/zgr4Yzfvb/E1JLkBs972UwSRITe?=
 =?us-ascii?Q?pb6Z3x6MNBeYlIGD+7lMrICO1bDwTjcTwpQBsUPCAnYvGn9Oq6NNptDaO16E?=
 =?us-ascii?Q?qpd8Rkp0V2M1i6KpCOfEvv3MiI8WI13bAavdqsPO32gMecPnR9QiVk5r2rCr?=
 =?us-ascii?Q?LiVYm9v/sFnnhhIkVgh2uaGDMO+FQopNH5Cjce8mHnINUSe9MwrXXJF/8yUQ?=
 =?us-ascii?Q?lJykgR7xt8PVG5HoY91DEt2ExvoSAJZYnGi+1PO54X9F4BZpSuGhL6/WXdUo?=
 =?us-ascii?Q?hCaG+jgyNjsPeWwJd2USIPgaMKzscssNU+/C4DRRkwu1PuuiDcJNfxXDe4BP?=
 =?us-ascii?Q?Ffhql6vtMA6rQ//WTSEDcme6vHCch/Rmg546sNs/wjV5XJKSrSPw87qdNoyy?=
 =?us-ascii?Q?6J+JSZSPUE4Nxgp/pyS9anbZb6dt/YTQGee8CpTn1xs3uAUEHYkSvhcyvz9E?=
 =?us-ascii?Q?elNETFy22EbArbBzm43rPT/BLZ51CwjD65oQNlhbZynQQhBoGv6YS3eRl+kT?=
 =?us-ascii?Q?S4KfxXLoxRMoqS1t6z43GqhA2+w7StmN/eLwMhBCRiZDzW7S+snGM4lX7yg9?=
 =?us-ascii?Q?t1EU+ikKttgdrF2PpzhFcxXy1BWyPqsQNVeIdCBap16P4kTRwqoR9ThHrabo?=
 =?us-ascii?Q?pr0JiBgtN1KJHkdBMAx0m9cePf5dtt61rWA+EhVoMQWMb6h0kp7HtqPMTpE3?=
 =?us-ascii?Q?+vqIJPP5yKbcYZAEnagebUi4VlpscdFB6r61S3+sM+jC7BvOwp0P4Ao0D5t8?=
 =?us-ascii?Q?HBF2dx6G1LIYdpTQyfRtVrFsGKIYXNn4HV6KmuMQOih58GpwL3RGCYdVRXtU?=
 =?us-ascii?Q?rVGDa3xx7jRPrQh9veDf+kN/AptEZf8dmd7ITci/BGQy1zb1tK1B1of18p+Q?=
 =?us-ascii?Q?MnVtIrde4s87SsSWi2lkYJ0UaY/E4Tw5qFt3z4md8tOwuLM5w2D7?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b8b684-80ea-46f9-2f62-08dee42e28ad
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:06:43.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXF7V1AFFT4IlrNUWEGVaq4gIdp4QJEiWF6uBguMtepBbzP6UlIconKF2+6XKGhRjrtWWWQ8PX7tGjnfjyvjMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6260

GET_CH_32() takes the direction before the channel ID, but
dw_hdma_v0_core_ch_status() passed them in the opposite order. This can
make the status callback read another HDMA channel status register.

Use the same argument order as the other HDMA register accesses.

Fixes: e74c39573d35 ("dmaengine: dw-edma: Add support for native HDMA")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-hdma-v0-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 87ba3e8c9fa1..fe64f9931bba 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -90,7 +90,7 @@ static enum dma_status dw_hdma_v0_core_ch_status(struct dw_edma_chan *chan)
 	u32 tmp;
 
 	tmp = FIELD_GET(HDMA_V0_CH_STATUS_MASK,
-			GET_CH_32(dw, chan->id, chan->dir, ch_stat));
+			GET_CH_32(dw, chan->dir, chan->id, ch_stat));
 
 	if (tmp == 1)
 		return DMA_IN_PROGRESS;
-- 
2.51.0


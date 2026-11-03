Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695614;
	b=m8haQuc+MQ5vydJszJdA4AMZL/yK+S0T+USizaM7q0vhuK3972yPaJHxXf4s6k6W+5vv
	 6jSm7nE3tX8tBOiEi2LIS+6sUttzkztMGp1QKj1gvRHxEsHwFv15jWB91jSQUNvFM3oGn
	 BnqsjuwGkc+kn2narBN237P6zkVXNETphTnwEzsrZ0QMu23fe+Do3UryQq/4gKe1e9rz0
	 2PlHV2H9QGx0HQIPGmnl+5K8uP9G9zm2fQpTHNgWmr7Wx5WtMc10osFaQ3iaHPS5Qe4YJ
	 jFs68IUS6lQTtyquQhvq1ORDcXTgTfAIbLKJWPhO+Rir9c6ckPd+i1e6pPZjs1RCcNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DaAMQAoNt4SFPNSlC3xspfW3NQhhhksEw3M9tWuIsZo=;
	b=oiYGhZnzshP7H63KSqB6/IXUGPXQzaptIqKYzWPwyPmoTRVKwkMjpaJnFhVa5fGni32O
	 bk1+AiJo5X8gzEUFVIMJfH3/IE5IC080vy8FVI8BtARurK8Y/JPVQY7ug6uki1/VIlZjW
	 vmWccCSF7WOanQX3aDbxEvG7FwWrkWqO/qDoCVysC1EeEto2iqNVuH7LvPuKeP0rSh5g7
	 7LlwLa4HvGv62KjtREg6/+TW811z9V4Raix+bWpjhg0uXAu/a2HRKIqFpn0v7H1YJfO4X
	 nUJcs/E9rW9Uv/rae4ZQHbPBEZ7CLXADe03KPh0EebwrvWArzMUELsdbP+VZgbSbtnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIYhkLiO;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92084606A327
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 08:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92084606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIYhkLiO
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a064dcfcfdso1385337b3a.2
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 00:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695613; x=1794300413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaAMQAoNt4SFPNSlC3xspfW3NQhhhksEw3M9tWuIsZo=;
        b=iIYhkLiOG5EZseInBiin8/zJXscRN0ns3L1Na+C6KoKr3hs/UfUk0CkUcHnCfRgbJV
         lxQJQHgRVh93SX7RXRZmj/kusDGfaOT5nFdK+dRuPP6U/xv+1uIcm1+XC1znmWZEDtZO
         mdEDIIN2g7GazojQxcm/vHklqgMzSmGchY32GZ5EtIpDetKb4s74EWbkBRh34FFGqDbU
         BDcVK7zHRlv4GZycaD6aNxPwkB2rdB7ywldssYLRJVncN3fx8aqLR262aT0FsLmZMBxF
         P6faGDTRrnmz2annGvcYlsfHfVPffGoNus8PVII0/Kvcp/w28tKqEuJTtbAM36rQ8uQ+
         y0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695613; x=1794300413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DaAMQAoNt4SFPNSlC3xspfW3NQhhhksEw3M9tWuIsZo=;
        b=Qmv9jU8nfF7O+XIy+JKcwFennyAf5NWWqjZOmelIZcg1kfip9voPlRldsnTNc2qkO/
         zWGkcfbpvGdni/50inkWXHkL3VI3IA+eM3P/mh9URwYbGrDbRBMj2l2G633NAg26FyzW
         FpJaWhm+f5nyATmSTU2pYnAsZmiMX7QImDuHS+USmDp8QAfjo1OJqbbtow14JHi1UvMn
         xgEnjh6Z8x6dl2FEq6rB2ntWhlXW94AcCk2dgA+rD+8FUJDr1cvtKJS3+pO6GPW0d6Lt
         UFvazmR5v4q2K5EpOnB3Su+g4KdsOpYqWkMzsncJJlv6Ihbz+0kS+ARmqTU7Z4lMGWC6
         zelA==
X-Forwarded-Encrypted: i=1; AKwUvByV4DdOJnra7xSFpdUi85cEXQflGTlFc5kYqSNKWF65PIGKeauInfnw6s9Qjs6ijQVYM9Bm3QxE4xA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yZdE0xjUGhGXRliKwQyCVE9c6bWcjtr+metCQ5jLFgalzzbl7
	yc+k51GoNrcWhkFW0nQLuIRGCb+HE3R3RRftzAkh1C/XgfCrh3JJrZLo
X-Gm-Gg: AYBFou1cq4zl5wl7fALDJW3fjcDSl2UfgWgj5NNGnwbuWWOBn4T/rtC0b4lu3BFYuOM
	cJPfJL4rhtbo7jAYXDs2HdQnk2UPYCbOsRasv60fo9+v0HEQq03C0RqU57Esk9H7HCwFzNmVHGD
	aq3AOADK+m3nLNe5VEyQaJBAzhFdt3lYadzK+2Kq/7UA1Hh4jWXYcL1QnqO97dEQPq1SZT0CL8+
	IZAx++xF3QG5txRO0rsERPjW2jB94vC5gORCkMiKRftdviempQife0as6ViuAl62H6jQOpdPWc9
	aq7mOSqwVVtm6Mne90yWxcC0ZakEwx+h47JWxx0YPWGmCoInNp7kHdpQf8P6anMT8jwqqck7buV
	yyFIZEMwgT+62GyOp01o4VT6IdPlp7g1XMYaUMFWmjIGDBass9BUC5evYaMInMH5VIbFQFSBjEP
	9oxMfIwfiyXEe4wzEL/cjPHHR+E7CFCmZTXJto/m0/o6tNJtzbYagfHdKTtAKZa+dAPNQEvNJZA
	oRmqtUthZ+K6KbBns6kFBYM1gp0XsCVNpr87PT1M1/ZiyQKFo5Bm2HanF2ia/u2jxqoeqTqKNt7
	RWPP1wfQYf3kCYxVGGJHc4FleP16L4tiWb7K4NwqwP5qGUNV
X-Received: by 2002:a05:6a21:1f87:b0:3e2:86b6:9bf4 with SMTP id adf61e73a8af0-3e928d4ca2fmr9806912637.14.1793695612777;
        Tue, 03 Nov 2026 00:46:52 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364a8910sm901853a12.23.2026.11.03.00.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:46:52 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2 2/2] dmaengine: loongson1: guard issue_pending against empty lli_list
Date: Tue,  3 Nov 2026 16:46:38 +0800
Message-Id: <20261103084638.1190232-2-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261103084638.1190232-1-lixicaicai@gmail.com>
References: <20261103084638.1190232-1-lixicaicai@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Haoran <haoranwangsec@gmail.com>

ls1x_dma_issue_pending() calls list_first_entry(&desc->lli_list, ...)
without checking whether the list is empty. list_first_entry() does not
return NULL for an empty list; it returns the container_of() of the list
head pointer, i.e. a wild pointer into the enclosing
struct ls1x_dma_desc/virt_dma_desc area. The bogus &lli->phys is then
passed to ls1x_dma_start(), which dereferences it (out-of-bounds read)
and programs the DMA controller with the garbage address.

Switch to list_first_entry_or_null() with a NULL check so an empty
lli_list can never reach the hardware programming path. The companion
patch rejects the known producer of such descriptors (sg_len == 0 in
ls1x_dma_prep_slave_sg()); this guard covers any remaining path.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.com
v2: split the two independent fixes into separate patches as requested
by Frank Li; no code change.

 drivers/dma/loongson/loongson1-apb-dma.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd2..e7eb40584 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -478,8 +481,11 @@ static void ls1x_dma_issue_pending(struct dma_chan *dchan)
 			struct ls1x_dma_desc *desc = to_ls1x_dma_desc(vd);
 			struct ls1x_dma_lli *lli;
 
-			lli = list_first_entry(&desc->lli_list,
-					       struct ls1x_dma_lli, node);
+			lli = list_first_entry_or_null(&desc->lli_list,
+						       struct ls1x_dma_lli, node);
+			if (!lli)
+				return;
+
 			ls1x_dma_start(chan, &lli->phys);
 		}
 	}
-- 
2.30.2

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738717;
	b=j1rNNzlcKyti6dBs3oBz7nhBcQ0Y21+yLWwOoUxAqex5T2ekdMUbZnVblwJi6aDMtdtf
	 cIGgVA7epYNyZq7Cj9+t3FK51i35MylH2mw4ITKYwAdpXbQyTFPP71PyH9O9mjkq+fetH
	 qrSNZvkEDOTmaOTGIyqLaM5rJH8G5McOnEzpWGXxYegsDovWmWgqYHvOA2x8AI3ugt288
	 oUxVANQh2CCQ+8hKLRrknEMQU6wx7oBsAq0pxvUOg0pgEK3aGoCKsIwRWIEBYJJOeO6MP
	 aiei0d03r5m1FU37qrL3L1kmiaufnC5BqscYQ6w+WS7dmASYbEZY3A1aSvfh5AQS8zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1DJT0TfcFF6fHDkLmQ9YCOKDQzpNymd53lcGEn9Xipk=;
	b=hvKZPfsGe+a60M8VWjFYw0854WcRzzu1I0Q6q5l4dBP4WLysUcQMhSxTQQOcggsakJnD
	 3hPB/hYnThZpk++5bGd3ZIp2lqrTqBOUTNJA0RIN6aQSU9wFfWb7d5HnY3Ym9TCfwW3Ep
	 VpDtmfo5h2/2WXdS+N7v1BrEhTlPu/PNl0fybhFj4pBTNwdS4zHsW2egNy7Sa86mpBgY2
	 Mftw3Tekk/qCgVA6WP55+MJf0tZktkAQFF8QmhwdH4g/ApI2ARpf2DU98WlsZn4v6S1gQ
	 0InOWEU4qCFcpaQGs4uqu2n947ROj9bR/osLSIcivJO77EyU0gOuFKCO96kQ0dP+Q4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z78voDaW;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B269606A31A
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 06:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B269606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z78voDaW
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a070755c8cso286737b3a.0
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738717; x=1793343517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DJT0TfcFF6fHDkLmQ9YCOKDQzpNymd53lcGEn9Xipk=;
        b=Z78voDaWjNne4NIQePfNFiO9re/79gRrqzJNO1dxnnVb5A1g3jYF0f7wpIBEu4lBna
         zOrnABxhHnktCgZwCiOWPoKcklMPMFkZfdFBPEnYXm4sugeXqsHmMzhXBLfKkDlBYZ6Y
         s1c0Eh84hK2lACTp8ZKNYcU5AADP2q9XiouMDsrrt2i4PzsH4IcNdhLDdHeRmAj+1YLa
         gmyJ1wm6sMIs4lLv6Lol64RibcXy77pnPu9Kyu8eJxstdKFY/DB8f7FTM4OG0vNe1Ypa
         8MzOvqQkUswkl7Xt0qhX7iSnF7ggcxDsvw4b5/AE8+NfclOjKSLwc9Dug7jcsg2kn1zl
         /skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738717; x=1793343517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DJT0TfcFF6fHDkLmQ9YCOKDQzpNymd53lcGEn9Xipk=;
        b=P9V6dhojFM0ic6fQDOUfDNFJrNBXlWqCHIQzzUfA9h/4DhokptebOjx9NFsv8RpOdh
         QaoabRTEbnwVmAFAJARoiSctbB9HiJVyxBi3rrX748ycD8J5TxKXLVNx311UmbnntJ9J
         ybf7ZwuZVbjMYBeVoLpfq9lN3xsUVf9qzwKDvDX6vXKUraj6QRh8McBspKG4LKQ/aHuX
         ZubKsBdI2OSB8thKF5GhlESv8N3yu4enoPddO0nS8OCf+2VIjZC1eT0BkSRyKC81B8pV
         OJN6UYkxJHlCQVDTC00Dnk+RuubK0Z9Y59cEWVlJBAQWyUFsbeIIqQTnolsJrXWRZkoK
         reOA==
X-Forwarded-Encrypted: i=1; AKwUvByJvNOnZOEYpeNduLZcQasOe0bytTKv5a+RFKhCkr8adNnZMBQN4gjG91lyTNVghuSnPvLGe4Oww4s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZhr73jQ5f/S0dU0rafZS6GCUnVkqPxZMTG3ibiLPFvp3mex63
	2SJRhdFj4d45vjC1LmRhE0pSKhaBIsQ+0WFEPPI2ySkYPiXlNn7yQmPD
X-Gm-Gg: AYBFou2s36U2pl62gDA+T6BUFiLzjJnZKsYG2nmcEf0I6UunowLfa+JK8CYknTjEwVT
	1zfh92fUhrIMCwCZOQNn/sb94Y73UlIIgRrhfCDED8zXTqt7xpwOPIYjM9L+lDJYcoIcfzbQrVN
	mHzh/10ZL14ZuVOcK4+fO5p0N8BuoR7jDMvKs0ztY5G5C55NeSJpzOXGyP6SEpS9QhTezCn4vM9
	CTa+EtaCiXv8Lp7psQHVqUWcPxp3mxQkeAQlpSmCPZeUf/uGZ0APLi9FntcvkrYtABdXP0aThFU
	3N2lXEPBTMMOEr3RCfWy1IfuEmMmrA7AiCvMkNh5ux/k22gXXvbMoqAz60AZo//gCwf1EmwMOW/
	pkMAk+PgMVgTvSYbp1ZDcJI413l6UD7iIi6UXBDo/QhAWpvtcnGeUNU6rSKKEvQFNqazevFbuxO
	2O/Me1SSJjugdQvDkkpildgkLX3/qLmil0KN8ix2NrKwBePwq0F6OnyYuKJB6dMeNuLAiBkPgZC
	64zrqwzaEjpNvF9poVNDxGt+CRZ2wJfUy1DQr1BdKZm0x3tveN0zSd/IwXljCwgMzBglrr1FC4=
X-Received: by 2002:a05:6a21:3d8c:b0:3e2:38b8:ef40 with SMTP id adf61e73a8af0-3e3766f0158mr839251637.62.1792738716652;
        Thu, 22 Oct 2026 23:58:36 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c89d6386sm381522b3a.10.2026.10.22.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:58:36 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] dmaengine: xilinx: Fix wild pointer dereference on empty segment list
Date: Fri, 23 Oct 2026 14:58:06 +0800
Message-Id: <20261023065806.3175584-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

list_first_entry() does not return NULL when the list is empty; it
returns the result of container_of() on the list head, i.e. a wild
pointer that points into the enclosing xilinx_dma_tx_descriptor rather
than to a valid segment. Dereferencing it reads or writes unrelated
descriptor memory. This was found by code audit.

In xilinx_dma_prep_peripheral_dma_vec(), xilinx_dma_prep_slave_sg()
and xilinx_mcdma_prep_slave_sg(), the loop that populates
desc->segments never executes when the transfer length is zero
(nb == 0, sg_len == 0, or all vecs[i].len / sg_dma_len() entries are
zero). The dmaengine inline wrappers do not reject such zero-length
transfers, so they reach the driver unchanged. The unconditional
list_first_entry() then yields a wild pointer: the following
head->phys / segment->phys reads are out-of-bounds reads within the
descriptor slab, and on the DMA_MEM_TO_DEV path the hw.control
read-modify-write corrupts the descriptor. In
xilinx_dma_prep_peripheral_dma_vec() the empty case additionally
dereferences the never-initialized 'segment' pointer. Similarly, in
xilinx_dma_get_metadata_ptr(), a descriptor with an empty segment
list produces a wild 'seg' whose hw.app pointer is handed back to the
DMA client.

Guard each list_first_entry() call: in the three prep functions, bail
out through the existing error path (freeing the descriptor and
returning NULL, consistent with the current failure handling) when
desc->segments is still empty after the build loop; in
xilinx_dma_get_metadata_ptr(), use list_first_entry_or_null() and
return NULL when there is no segment.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index cffe7c6fa..07f52f841 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -650,8 +650,11 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	struct xilinx_axidma_tx_segment *seg;
 
 	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
-	seg = list_first_entry(&desc->segments,
-			       struct xilinx_axidma_tx_segment, node);
+	seg = list_first_entry_or_null(&desc->segments,
+				       struct xilinx_axidma_tx_segment, node);
+	if (!seg)
+		return NULL;
+
 	return seg->hw.app;
 }
 
@@ -2305,6 +2308,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = head->phys;
 
@@ -2406,6 +2412,9 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_axidma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;
@@ -2613,6 +2622,9 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 		}
 	}
 
+	if (list_empty(&desc->segments))
+		goto error;
+
 	segment = list_first_entry(&desc->segments,
 				   struct xilinx_aximcdma_tx_segment, node);
 	desc->async_tx.phys = segment->phys;
-- 
2.30.2


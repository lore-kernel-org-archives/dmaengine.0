Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795520786;
	b=BUyGTTDbm1l3oqsHon1YEnF1gdmakjLqTbraziZ9wYT1XJD4rHZDpWPufao5TAIk4fzh
	 QWx+0xt38Ko/yO+3NdI0IxeJjPzZjg3wGjFhqNhbVFG6tjsx75sXb3fqFgAPVlncAH9+V
	 RB2I+mZEZpISLn3s4Udnh5Tt08aVu9Q920MceqptbVH4TXfaGEZuo7dvBvXFTe8+XSB0x
	 3gX4y4hHvES2C4Oz+qbd4NZPGahqZ3myL7OOxYLF3/3+adSLJYAL0ULbR4fI00lFfc7Tv
	 h0rJ7eBMjd8Da1Fqri66YbS4D6/S3tBSbdbaIt8Ahwi5dJo9RokQ//l2BQxqi9YZ3rQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520786;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2Zz08HcZjLaS0TJTRQJhra6xzx2tZMzbWAVsBrWjmS4=;
	b=hjYugIDVPkwpXtRaMCXrNO1VSIfUPkeePKOoDJplh+khZaH+nlhuCvITBGiXRXm0gpKP
	 gi24I3TsEHbIxTvwSQyx/Yf37BwVDG7xvu1Ucdp6zhvlYKqnjwxqO1VjvuBMxYtTzwQkQ
	 ycn8egDmnlhUu+Bz/ngcvxXfbuY2hRpMQXwyMP2/F3AFoH19Jd1PfWx6NUZB5oun6jyaF
	 TYFFU+JTQueO6jXYNIE7w2vDsWcsFEj3z5ERB0qdsdVjn4So57qi6Y18XJwaDV0UZMRBu
	 ArzEdkmV+0JYcmhYhCqTlXPnVqb55uuyBQRomXMFoUvO+aI/vxTfjcRKGARKDfZRrnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjagkggL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCD4606A31E;
	Tue, 24 Nov 2026 11:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjagkggL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795520785;
	b=M0gTENFTvswihkTCTUkXdpQlC5ExGoPnFloMoMTu4BjlU4S+lbvk0LKZ30zIIv5BEqH4
	 FAumdt/j9vjh+CNaFrUzjN7ZVdvHAheV1F29suqSopHDnUBhLS9klFS37N6t664EXTlaT
	 kfwtxZjadybZAJSkDu71uqy/o1gaL9jFaamrvtHYofN5jKINLrtUmTfPSib3mBOXHZaeU
	 Zx+bok9CLgDwOJMIWtXokG3eTQQaPVWtfUD//IkIYJt2r5t9anD3iIR/ZsO8gVoKHuVFi
	 lFcj4hB7b+E7i9pHeYckrJL5MPT0mtsss3lL5myE+mfXobwRGbp4hdz+W/Eat5WOcxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520785;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=2Zz08HcZjLaS0TJTRQJhra6xzx2tZMzbWAVsBrWjmS4=;
	b=yQC4+xKUHvBBxF9yGWeNHtbHnO2gX2MI0Q6DtCQb/SSeVsMcC3U8vg7so+33wPm4G3Nw
	 XdVDkp4zYSBtaUCVVgwJ3PF3c/uHhHX1bNVovMLdupBu4I/deGeBGKj8Ra+rxmR3bgqGq
	 /PAF6qNB5mqoNcf6LD5aSGifU0E8pQYsagj82GgPlJvi4DVs/0LwCgmlrinUPhQ0EugW6
	 YQvcZmlyz0err5zMoQkL7xe46DMPzVjgoW59Xnum+oXRlskbvgiZqj8EYh9A3oO1pA2IV
	 zNQXHblVTzEebO2XPQbq5AhesbvQnzYrpVYOivX9K9G1KjdM1Gp5bAtcmhm0yOqSMfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34CD01F00A3C;
	Tue, 24 Nov 2026 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520785;
	bh=2Zz08HcZjLaS0TJTRQJhra6xzx2tZMzbWAVsBrWjmS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SjagkggLOYNkPxeIo+sj7KYBN3s5XTrrlJVSy9lulDP6zBrqjCpCCT9LUZVwMwKVt
	 khrLCBBbe8twWp6tV4SimBUQSyWjmk0k/6fU9pE/jlcrflfj+kyZ8OHgeBEcHxcF9K
	 w+LQC47eDa8WUODOmdoDFA7qL/fsUpdO71Xm0yfN/7LZL5J5YjbuFiQZZhhVxNswXW
	 T/lk5wHulFz10G3H3oyM7hz7jxoJJSegjfI0M5TWR5Ww1Y8pt8Q+50O9YYFthL/rX+
	 cBg4EERhNzl+uzf3/cArgzKp0L1lSyNY/wX+gdSXqWz4hZ0qe/KsMP9IsAO+yzWtAW
	 ncj409ywl9vNw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 13C8B4CA37;
	Tue, 24 Nov 2026 11:45:29 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 17:15:22 +0530
Subject: [PATCH v13 20/20] dmaengine: ti: k3-udma: Validate resource ID and
 fix logging in reservation
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
Message-Id: <20261124-dma-upstream-v13-v13-20-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
In-Reply-To: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 sebin.francis@ti.com, Sai Sree Kartheek Adivi <s-adivi@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795520724; l=1811;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=3SmkAPYsTzacE+IK1GgfJoKJ8iRPP+nzvDNxs+11xKY=;
 b=s7M6c6qRUdqFBHU8PhL96fM8whg+saMsieN9Pil9t9aJNsjhbo8Ql66Q1SBqQImGh9V8tevEk
 NwXDhzTW6wRCoY7I3WYGg6kc3so7JBEDCU+ruL4Jj4lwXHzKX3Yb6Vj
X-Developer-Key: i=s-adivi@ti.com; a=ed25519;
 pk=EtOwVxmXDuYMgw3DqFtPDBpf8ZvbO89w1fJm4w5yPI8=
X-Endpoint-Received: by B4 Relay for s-adivi@ti.com/20261124 with
 auth_id=1627
X-Original-From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reply-To: s-adivi@ti.com
Content-Transfer-Encoding: 7bit

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

The `__udma_reserve_##res` macro currently lacks a bounds check for
the provided `id`. If a caller passes an ID exceeding the resource
count (`ud->res##_cnt`), `test_bit()` performs an out-of-bounds
memory access on the bitmap.

Additionally, the macro returns `-ENOENT` when a resource is already
in use, which is semantically incorrect. The logging logic is also
broken, printing the literal "res##<id>" instead of the resource
name.

Update the macro to:
1. Validate `id` against `ud->res##_cnt` and return `-EINVAL` if out
   of bounds.
2. Return `-EBUSY` instead of `-ENOENT` when a resource is already
   reserved, correctly reflecting the resource state.
3. Use the stringification operator `#res` to correctly print the
   resource name (e.g., "tchan") in error messages.

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 42c4064d72b4f..20a2ef5445ae7 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2046,9 +2046,14 @@ struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
 					       int id)			\
 {									\
 	if (id >= 0) {							\
+		if (id >= ud->res##_cnt) {				\
+			dev_err(ud->dev,				\
+				#res " id %d is out of bounds.\n", id);	\
+			return ERR_PTR(-EINVAL);			\
+		}							\
 		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
+			dev_err(ud->dev, #res "%d is in use\n", id);	\
+			return ERR_PTR(-EBUSY);			\
 		}							\
 	} else {							\
 		int start;						\

-- 
2.55.0



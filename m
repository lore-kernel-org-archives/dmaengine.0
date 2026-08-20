Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C864772AB
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240284; cv=none; b=oO03JdeB6ArFaMnmFWo8bi84dWSAZF7WfCXkkNm58/dxGUwLM1Ht/ZaFQg7X/lQ90WunfRwcUvy1+eilRgs2dDFr9cbGESl+aRKWHqdtN7ANNmIMOQaGKaimA/Q+t2Uki73D03oW6RDDyhiXOv42+hETySEaLL1ZvsfTNeoXZjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240284; c=relaxed/simple;
	bh=ea3QoCySM5JsmpIun24JJSumiEve/eblzmmk+FOzobI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=me4QTznhKLiZoSLB157e8DGCeTP5T6YjF28l3cdgToAEZOmtaOfPRbfx8QqNRyqzotCfeTxGgADftBlBpzUeHVnroXtXRN/ljqr7YgjuPJRlSQ7vhnUliQ8ThDSlHGgBTfdO1WQeQQ3b2ofTOIl4MG3OSOlwhD/OILt8727mpmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9+N8L1C; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9+N8L1C"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1137807a91.1
        for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787240283; x=1787845083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ea3QoCySM5JsmpIun24JJSumiEve/eblzmmk+FOzobI=;
        b=e9+N8L1C6+WllgkJVL6tz1Cpgg9K8iiDFXOGpxGXCbJc/a20bYNe2QT/UUtUhapOd3
         KoYUB1Xe9NY5jPECfLWq3DaEbyHDtvIHkj5GupinXdoAHXUJuTV2/7Bu6Ry9N/KkWjdL
         PQlAl/9VzEknAgnltpbs9T7wrnPc80rvjuq4o5F2urHClI0SCICETxjVk0gyNOet1HYA
         VpsXrQy3KWS7e7H6CgyRzvbgjjhlJoNanJCWaUCKjB31KxHjCipazBTntJ7yx502VKA/
         4f5M37/k/spOid/7C0YyKAscs4T6wHRMU7kdwTPhZhvX7XHXJNa1fTz6aAyGGL+0Jd5K
         N13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787240283; x=1787845083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ea3QoCySM5JsmpIun24JJSumiEve/eblzmmk+FOzobI=;
        b=s/kJtAtMaZOZxxwWWC9kj3qA/9iHjMY1XBSTVY4Qun0IoTNPX1Ypp/Tq+uMsYNEMhv
         +eY1If49V2kPCe02iE+QcM9otEIiV6OPzezhNbQYmm0FSRGxNbdJQtPUXB/V/owN064O
         O+SXsjKManF/VJTciaIZjhMaTcj3SR2Tm+sMeBanDmO5wTuHf6psnLnX/NTX/3Tm5Hms
         khB+SG/DKUd1G2HBpV6Rx6kDhWhKyI6CLFB4Hlk5Gwk4ytsEYLEhLGkS4ZT+PmmTtwlA
         4cQPEzGS71bv91chU6ZOLgcCJ0zbKdDbJq8RtHe43qLstkm1Y37zjMBgxaIBABdX1jAM
         Ptwg==
X-Forwarded-Encrypted: i=1; AHgh+Roi+nnGm9r0IsQN1/35g4iUFX9mHAnrw303aqSdw7eJaXLDBfVdBXNhLC/EhWBu8pRP3H5vAPVn+4w=@vger.kernel.org
X-Gm-Message-State: AFuF++kaY7v/W/VbY/xoXvKbQpHBGS98vqyWSEZkrNRjOtQdeIqJMU+v
	KEu3nzvRepPdy5MG335dFW+gT77qie2bAnWYTkkUzn0XEfrRhbw9f+g=
X-Gm-Gg: AR+sD11PMA/n3uDSigz02rvjxE/4SqBuLmzqvcTqpF3TG9mkplOgR1Xa0zyYGzu3Zd5
	nvJlvFELA2zUqjpOUNOdxai0HJRo4hJSI+F1saptH+XqVlT+IJ9YWYYK5wQQD9Myuy9e4hs+nWh
	2W7MUTqBMP+TAOCe1Kcwaoz9TxcjT1OsJm2PtrUuE3k0NkZ+US4uEm23D9It9fmtHdQkWynEH7Z
	7IW0VtNa8wKrJSIHepgvZbPAexctt4yrABkuvupGOSUsBZA5wFzPZ08HRe1B1i6SQPixxEDmVMy
	P+vPHTSJ+IqQJGjQFBS02J0dMtj3YnTKNeyeDW+9xt+pFNX5lNG+dZcoZc2HDsPus5P7qEHa8hb
	ZZBjURexiT04YJEHtAw+BaIpBTIXNS75Qe8n9UwR3lb+KHfR+cKtE4d539X2d0HrJ+157IACpzf
	VPWPJdMFUobUPCqZ2vkvLXS6RR576rEAjG0pMUUdEPMG+098ziA2urw+XxJEpcPi/nRrB0nyrZX
	bh+qNGPdciWrWYOlRQQi93sJ3mvAs7YDFj4QvTZ4Lj40iyPIlkeePxFhxFr4ACzPV5U
X-Received: by 2002:a17:90b:2584:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-395a074aab8mr7953100a91.10.1787240282774;
        Thu, 20 Aug 2026 08:38:02 -0700 (PDT)
Received: from codespaces-2db70c.3gx5x4kts4veljes22u4ri2f3b.ix.internal.cloudapp.net ([23.97.62.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96cd4asm7522677a91.3.2026.08.20.08.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:38:02 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	triet.hoang.dev@gmail.com,
	vkoul@kernel.org
Subject: Re: [PATCH] dmaengine: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 20 Aug 2026 15:37:16 +0000
Message-ID: <20260820153717.4095-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aocdFqx-cRl4mUsX@SMW015318>
References: <aocdFqx-cRl4mUsX@SMW015318>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Does other dmaengine also convert? if not, can you convert all?

Hi Frank,

Thanks for replying. I have checked and see that other dmaengine also convert.

BR,
Triet

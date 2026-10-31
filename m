Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408307;
	b=fN7L/29Cq9X6ET7yW3NPc02NoOWgebgINy3qAFt9a05sJtn6HR0U3Xwel9GIQmnBVlTJ
	 aaP7arEQvFdnmP+pZnu1k2+YDFgD3IkXvMb3GKEmCwjMLUgMBCSi7klNtEpeQlXqCVS5g
	 RGBerWdsj+U45r1OIZucv/XIMViHyUg2IMjFs88VIrtH04Q3nc6tzVh4H0Nhlxkcu8fXP
	 YNr7OOQ+AQqxnA4Y2FUEfQH89Z0steeDSYLeJXuZsujCPMMiU9nPdzyaxJLsD25ji80XD
	 UJZL722GBU1X2q4X/v6/Jl6HXi0NcHYZ51BXyKUo6g4oUsmbYZ8rSixjGSn7G2XGIsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zW5UvcivH6E7BIbJRCa4jWGgQMxs7esFMSqsxUz89DA=;
	b=0lu89WsN2rYUTcaWDO8S3EZJXRvz/PywkBEFCmSViaDO5kHTe7FFgXm0ccAXcW5sMww8
	 4v7gxgka3C+D668WwpLyZJ9zOA2ftvVdOExXDFECsHAfB7chSaE071xRJ6j9TABq1fEtn
	 bCZntn3I3os5iHFRxOmwCYbzjQgQrR/gODHpBLryAyM+F0WpXKZ759+LeACNORlwVjgBS
	 wHfuS8N2tBkpfzYQ+4EThZm48PKmcFGMT1xj6uZNLakOYiesICFucXxjkfLEFGulLQeUg
	 JsWXiwUTBvgHBrcecRCD8vLj6yK388VLsOmUYbDwiQnRHx7eC3icD3Uk9thzFODrWmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEPUfn5Q;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D5A606A31C
	for <dmaengine@vger.kernel.org>; Sat, 31 Oct 2026 00:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEPUfn5Q
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a18fc7a38so551026eec.1
        for <dmaengine@vger.kernel.org>; Fri, 30 Oct 2026 17:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793408306; x=1794013106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW5UvcivH6E7BIbJRCa4jWGgQMxs7esFMSqsxUz89DA=;
        b=rEPUfn5QmD5IGvy6JDCcv65UrQ3AIzRqq+JBlnuAB4gSyrvMqONNeVFhN/n6TSr8IH
         ArXmDatgYTnyKWKJcCSSHb3T0WCuQHqgbU0V9jQb8xIicT6cru/o/QFl6v7WZieYAbF8
         6Ndq28PUTsCisA/XDR7QJWeoeGpqBSCpjvQrgyXhW0OMl/1iIA6WWzbOK9CEN0+nCxvW
         wOD6mlHul1q04YEBDowxEYB0xDPtkkamjIw2CVBwn8pT6oNKOmTkrwYdCwceQKVNweL1
         JyPqDYPF0Dm/bIleQqcRU3BsUYXV7hImQNfsjSfTvmgwYAw7tMhnCNwu6RbO7CVr3XmB
         BpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793408306; x=1794013106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW5UvcivH6E7BIbJRCa4jWGgQMxs7esFMSqsxUz89DA=;
        b=dQaYr5wfk29B+H5jbsspIsQ+5nHVTGY6rh2ljIcGd/H420+qZHVP8qwIUXwQEdlceH
         yvWS9hDPvUkmsIDI/1AlitzVkwR6yi8GJRncX6xr52n38DxyCCZbikFlJHz/a9hDSiHa
         9XJz4PCYOFMvlVhLUF4sL0e2jjw9qPEn7Mxb0bPNu/a4FR2EhjytAOS1Kof9Y/LsbjAh
         dE5mqgQPZWmZn7Wz3HSZSyLf7Z9w3jkw+Zcm3qUMoXdj7TKrXFziE0EHI3VYJq7DPUYU
         Jz4l+I9lZon/EULQPOO6+sZcfp21MCusxYb/0Z+YXJN+mCZm3ksjVmeOcuvgKUg9pZRF
         76NA==
X-Forwarded-Encrypted: i=1; AKwUvBwuN4jitYW/Xb6AMGPsySd6ruypS1oQS/tbZqzzzocaAL1Ujw8HF5LAcecG7l4zQisNf86toxrt+ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYL89PBEwoa3mGdyUklnWSiDsKGazgcQ1gyDdwjS1zWL1imEmRxG
	YDcT+erRw1L3Si7M0cS3Nhv9lGmfj1ZwzhQy6cg9pBwWbnWotTCAaiRi
X-Gm-Gg: AYBFou1ko0UjvUrBueJ9pUJa3cO3e8IuG44YIDa9WJ7pV/CuTVEz6QgxtjVvJlUgAC9
	9CC0T1ViqBvpFkHoAZ6fKzsOOKi0ewKbyzOcwG03O+Xq057IIukMJGuBZk+wiwNcEA2wOQBMGKI
	nLBbBDx0msaH8uOgjd6gl1DUt0RfWHdLE2gYL/Jjughr8LQWzSD1aWHFvoteujPbTQMuG564Kv8
	5mgldGoo/9FZG4jY7a4Nranb3VmlgrBKxU1+2PU0/FrtwUwm5pcEcoW5jWSewHtaSrhJN+8s5dV
	cIwTAZoD0ljH863PcGO/d6DC0hJnU3QXz+JtrHjqASylH3uc4h50h07asZBiLu/jJCxsIjd5uWV
	3UygVh8EEl/UG62SGLCOYYo3IARPGVGU2sIztkKW/Me6ZObEzt23VmcqT9tBrdWKquIbkkRQFyx
	I486YKbrHftwdDorT9vq8DhK2GUTO1Xc/SG5wbOTctOkDI0rk/A3eUhbLaWuygVK+JUna+PDsMM
	yAxr7J31OfMqAb1j4+dNYWJfrUIH/VzzVoWyNHXCCRyyM7y32cu6FY86LeOHNP+u1ojFmR9+zec
	l/oiFpXWPSJRrExhm21sMBuOSZ0P0zIWu5y6d0XfuZR5OhLDVB47lBhOqoKi9SI5zsLzAqx8Qix
	66CAnKYpLn/TnZbCKI6iVIV8JWyu4ffeQ42r3kSJ3YWU5zMCUDLzU2eAdnAkCXnJwx47nRTDQgJ
	tBSgyef8Ui4tYiLg==
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id 5a478bee46e88-36a423a205fmr6672963eec.16.1793408305799;
        Fri, 30 Oct 2026 17:58:25 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm13094902eec.2.2026.10.30.17.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:58:25 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Frank Li <Frank.Li@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: dmaengine: pl330: no device_synchronize -- does terminate_sync guarantee the transfer stopped?
Date: Sat, 31 Oct 2026 00:58:20 +0000
Message-Id: <20261031005820.3354888-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hello,

I'm trying to clarify the termination guarantees provided by the PL330
DMAengine driver.

PL330 does not implement device_synchronize. Consequently, for PL330
channels, dmaengine_terminate_sync() calls pl330_terminate_all() without
any additional provider-specific synchronization.

pl330_terminate_all() requests termination through _stop(), which issues
DMAKILL using the controller's debug interface. However, I could not
establish from the driver code that this operation waits for the channel
thread to reach STOPPED or guarantees that all outstanding bus writes
have completed before returning.

There is a separate callback concern: PL330 uses a per-channel
completion tasklet, but pl330_terminate_all() does not explicitly
synchronize or kill that tasklet. The tasklet is killed in
pl330_free_chan_resources().

DMAengine clients rely on dmaengine_terminate_sync(), or
dmaengine_terminate_async() followed by dmaengine_synchronize(), to
establish that the DMA operation and its callbacks have completed before
unmapping or freeing buffers, as described in
Documentation/driver-api/dmaengine/client.rst.

One relevant client is Samsung UART on Exynos. Its release_dma() path
has a proposed change to use dmaengine_terminate_sync() before unmapping
and freeing the RX buffer [1]. The safety of that ordering depends on
the guarantees provided by PL330.

I have two questions:

Hardware completion: Does DMAKILL guarantee that all outstanding DMA bus
transactions have completed before the command finishes, or is an
additional wait for the channel to reach STOPPED required?

Callback synchronization: Can a PL330 completion tasklet still be
running or become scheduled after pl330_terminate_all() returns? If so,
would implementing device_synchronize to wait for the appropriate
hardware retirement condition and synchronize the tasklet be the
preferred approach?

I'm particularly interested in whether PL330 currently satisfies the
DMAengine synchronous-termination contract, or whether an additional
synchronization mechanism is needed.

This question arose from a research static analyzer for DMA lifecycle
ordering and a subsequent source review.

[1] https://lore.kernel.org/r/20261030162334.3000737-1-samarth.colleges@gmail.com

Thanks,
Samarth

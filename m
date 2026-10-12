Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990AF309EFC
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799991; cv=none; b=DGME20GTaPREYwY8RGo9BLSOJ4OnfcUOajaktFjQIJykJ+mQ5X5DVbfWlMGKx5UtpTcY1pk7HTSiU3QAPd8Sc6IyYPThRrjv0Kg2q6ktKc00cQ+VIDQp3VpHknK7dcK2JdPPoU/ua1g/BW/aOdB/Nn5YnwvOXAk0wJMOO84dD3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799991; c=relaxed/simple;
	bh=a9wITDWNYCyDc/6M4gzNG7p5rTn5OkesyFvug6cv1E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N70Sl1Of09o/Qlew5kJ/z+H2ooyS5KYpCicFf97ley2WKMIk7GwH4L+eQRKQQDnC/2KLjs0MB1dOZDkkEXCJ2ymVSbRaWBBt8Ju6uIjjoulvEsIBq5f/UUCR5BJiHPDIb2k9vqz+Y5pYL6q2pOkls5Dn1And675muF0kylRrTKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DPLvvQd0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DPLvvQd0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so20961225e9.0
        for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 03:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791799978; x=1792404778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBH7MrtvWb2jpzSRxs5Qbj54HzWjkwoKw7gmLgBjG7o=;
        b=DPLvvQd0JG/JWKg+0xjoiuX/UCc4WvHthjl+rajlQm0ds0jQZnttVAutur/vUFgEAb
         cAt9/xtrH0txUKsJUcSnCfkIwrQVna+Yk5Ue/awYpRLRZQlUn7gLNP0VanxHU46iZnm0
         eFO+EfjJWTR52d5N7qpd/hK2hWQGTgLmMpY56Q+y39e/Bz9LY77AqZng2QRoLNJubLqi
         fGjkU/foIJsaaAtb5EHWJlvlgFJtXUk8dX9HWrli+mimKsIwbmo0cbOUkzMRRi+jezgZ
         gCh1HSU8e8ZCTVRkqkX313nlyTJxsxPcgU3TbV6SgMVU9cuD8uFYbhMhunUkJRt/zXqb
         Ct+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799978; x=1792404778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBH7MrtvWb2jpzSRxs5Qbj54HzWjkwoKw7gmLgBjG7o=;
        b=sIZ7L0wJZXNT72l/xIotyLlvcMkJ34LYzX24kxnxGjGIwGnbAbvUlksF4UvHBczOax
         FzraJ/hlpgB7PbtHeS6ase2rgkzBgHJZ2Jgjgk5j6k1pP75xuMxqhK8m0fX60P48Ftj7
         0QMSz2RC/LXM4cPcwo8bmAsBiOmi8kZG0sQbkw8dyzdoW+Hbzr4ApV/tattXIdCgL/vt
         1LDfxrAY+Iq/me1la56Jfp744uNYj/MDKl3ClxckpNCgMsWXnOormZX5nlqJnzm8PbkJ
         OG3gLcuOmW3F0veXo+0gsvc8Vsn5obtAhKI4UWIr3Lwzr7bjTmhmpUyeuNNRpO2VjbyB
         D7YA==
X-Gm-Message-State: AFq9FYJldERe2kGBEv2SUqxoBP3ciUxy8thKWSnIZ2i0trHRDFmXZ+9A
	4dAYEOv/Q8khemUdSP9YBXIlakvx58r43RtEKPqQRHBLmVeXE1PAdFbM2L7Cm3rIh+E=
X-Gm-Gg: AYBFou03OIORp1Ug3cJa71Y2M6VCS0yyURETHAqwL5kPYYGUWxTV33P+AVaUcj8Zk/C
	KYcV39Jiq4aSdZi92c2nvnOGx4nGRnBPo8mOS69Qw8LqySjwnCgJUEXrXTenL5CNBEuyLRIKHAc
	KoWR6eiWTljjsCKZqPyl3fR2+QFKvtaT88d8ZJKmPtBPETJxpsR2LAuoRZTiUbgOpwAh57H4Q2L
	lqSzmeP9KvUxX1lI1f/WHMCBLj+APQ51NNEIMWKC4vaZyQI+PcKa1P+NL0JCPw1tK5oKVPEMNQg
	NZXcrKs6pW6Re6ig7uLooLCQAYvGOjtUYhcHjSLn5Xc6WMrjpd3INXGJAitPUDQ7B6+GkGqJSzY
	bwONQV4HtF5W+VGG7WMrU6W95JN6txCdx0Q8CqKe74EWAAKgbQGZrBCIPwHjsiYo0ZVy25sloDe
	VqtHndZSkPN9JEUijmGmQFhu5eJ0jqArjC1xxhu4UMZvQNo4wldMfR4fr4G9KKVBd6dyls1m0lf
	cd8Pu0=
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr170900145e9.6.1791799978068;
        Mon, 12 Oct 2026 03:12:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm278112685e9.15.2026.10.12.03.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:12:57 -0700 (PDT)
Message-ID: <3ff66de9-4b90-4fac-bd67-7b21aef9aae0@tuxon.dev>
Date: Mon, 12 Oct 2026 13:12:56 +0300
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: dmatest: fix race between wait for thread
 and thread start
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Seraj Alijan <seraj.alijan@sondrel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828151024.2081478-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828151024.2081478-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/28/26 18:10, Cosmin Tanislav wrote:
> Each dmatest worker thread has a pending and a done flag which describe
> the thread's lifecycle.
> 
> pending is initialized to true when the thread is added to the threads
> list. pending is set to false once the thread is actually running. done
> is set to true once the thread has finished its testing.
> 
> When the wait module parameter is set to true, dmatest_init() waits for
> the !is_threaded_test_run() condition to become true.
> 
> If the worker thread is not started and running by the time
> dmatest_init() waits, the !is_threaded_test_run() condition will be true
> and the wait will stop early, before the worker thread is even started.
> dmatest_init() exits, defeating the whole purpose of the wait.
> 
> If then we try to remove the module, kthread_stop() will try to cleanup
> the worker threads, interrupting wait_event_freezable_timeout(), which
> will return -ERESTARTSYS, causing the "test timed out" message to be
> printed.
> 
> Clear the pending flag once we wake up the worker thread to avoid this
> race.
> 
> Fixes: d53513d5dc28 ("dmaengine: dmatest: Add support for multi channel testing")
> Signed-off-by: Cosmin Tanislav<cosmin-gabriel.tanislav.xa@renesas.com>

I've tested this on RZ/Five and RZ/V2L, on top of next-20261002. There are no 
more "test timed out" reported.

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

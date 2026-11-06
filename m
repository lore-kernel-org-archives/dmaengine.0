Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926320;
	b=rULT4L8dWu+My9fLqS1dUrLXN5bWL44yda6zQKRx/VzLsKJh6RfbksN1rFxfOykG4yhj
	 pxqKoT8VMDTgbPSzlox6+2i7XBUpDeOr4DSQZLs4vh6ZxHW126U/60WDdfXkXtulCrBW8
	 ohBT1rrg/Zdpc2s4a15RnYOt15H7iI0wObcoLLGN6KBRLXf7E2r31DViWEjVIW7sQ+HrV
	 wS1uxFZHHhaNBTdD1Fs+a7qO6UYmIgfeTLOWTHHyVKXG9W6+ErX4e5hv++NdJNNAo5QG/
	 5EjjrenJ83R5owv9FTa+RGu0HgS1xbCsEj/5AFo14thYR0IhIVXxwC6xfFIzlTar95g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HccsFfIxC59BPG4TmRkbnO73oNEkb5neUzsA3x6hj1I=;
	b=f0i8qmF9H46PFcfNzm7WcXFXkXFZSk4uS6sEZ5FpgmrED5k/Fb/1JbzRSKZ97WgzoGOm
	 qzskFb4L4VT/mGUqe3TPV2wsYcs1I738DHK0vwpnHG7n1GnWj0S194xXW3lCMUzyn+4kA
	 aNtpKq08gSbIpSSncj3hWWZICc6SFQoHi2gKRwjbbK8UPDB3k4W8TAFIvG81HZibIi8Ww
	 EvWa9m9T54xgz6/vrd37euvOEnYZ7Q/FbpH5PXfrDLkH9+ZRxLKoJ2STr4PuUOinmqYcc
	 exGxRa+dckYcSrDyzBBX5aGTChgeo7Kt3NJ6rxvgU1j/zlYkyaM/i6h9eAKtFgRoRaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sha1kl7D;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60313606A31B
	for <dmaengine@vger.kernel.org>; Fri,  6 Nov 2026 00:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60313606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sha1kl7D
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91c79a9a739so1327726d6.1
        for <dmaengine@vger.kernel.org>; Thu, 05 Nov 2026 16:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793926319; x=1794531119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HccsFfIxC59BPG4TmRkbnO73oNEkb5neUzsA3x6hj1I=;
        b=Sha1kl7DPVGpimiEW646Uqquan0LoglFIWNy+1rkgdhuF44v9lVp1F564USTSObVul
         z3G39GjrbdQ1WKxhuuTyf6IiuzX9x8SBqssTv+pTi6DjxEWZP5JHefsPC9qFhD1y6nRR
         cymRzMrCZCSaLgyelG4rMWPVbn/gropQwsFgERalpZjrul7X8Dg4rITqa4vm7NWeleMj
         CTlf2uoEmd1tAiFZOU8LPw+k2BydeQ0t1Bn8vJ3NRqCqsHlUsvlfrUOSCj2YxyRTk9YN
         /URpmZU0zkQ7iQ1nJdIupuvhgB2kqw4RZ/h6Mv+IjZIazGKzp2XQrzgmQEY3b/8qVYEo
         Iafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926319; x=1794531119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HccsFfIxC59BPG4TmRkbnO73oNEkb5neUzsA3x6hj1I=;
        b=SrLl6HU1aiof1MtZ5HiJFHNiFkTXMfiUuZcGdhhP7amIUFMBDA8i8rj3p3jnyZgJaX
         oVblum8h/+OQc8EEcqyO4QzRhJK4jhdlXwfnOpBKMl4v/azh2pQqQ5yzAyztLzAsFHgl
         CqZfTkWKzDingP6ipqTs9ITI2LCmQdN8FTE7qTLIn3EJuaiBcSIGo80rXCfd2KGQi8e+
         F+hcwDJLz3vt5QWX+ox9Mo9u3WwencXmrM3pT4Q8jJR9JXCV+6GXghfryziNdc4JwGTe
         4cYW7BL+J0O5oF3FhKxwSb7BORZ8SVaLIL4fmSPGYJjQrqXodgqgl+y2yyF3wR+d1Epm
         zvnw==
X-Forwarded-Encrypted: i=1; AKwUvBxB2qEdpmZZl62LK5PObG3o4dbulUF6MVLllF5ayYDK4c6X9r7L1a4aFC2cwoWLMSmwt+A4e9q5/0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c4jzW2unv/ldROBFs4WMIseOQYEPu7va/RS0iz4W0ny8SBeaY
	41yZaGdyS20E/Mfj6o3cqtEtIM+GakcL1AZn/TkJHsE2pdIO8hEyx9Os
X-Gm-Gg: AYBFou0+ouNTKsabhQgjYP2ojMgkdXP1auYX5ylF9n6jBlRL63HitMvXw/DwBpexJBF
	0T8v5Ykfq3pXQdtQBZADyvGs6qBYL6LO0mN2EdeqkZWeXZ32fcEJcrI767Ri/c7M7b0FTnaPhao
	f5CA+sU0o6URueMvad6TQU7qbR5P3CqfAv1VOiTYVuZrpkod1HyApxVKmJY4KQjsmZQreLNyGkb
	5TQ+me28dKV717T9CFw71OjhysH80dHWO+zIwJ1gXS7lP65HfZiZgutkpRTcFtVhSeAwjq1oL9e
	KXx6FaCp/BG/qMfKpcAp8Bj+5n9mWtoyXqsIJnNvvAB3/8VbnGt5BHEkSUgmv4YD7YMQ97zfBrb
	Curs1Yd7B1TB4tKLcAA+s8fcPQH4o0z1hFlEbiuj3vC1UkyEYYp6m6p2Cbz6w9x7/vyXMh/C9Uc
	WdAvsla/M8gEettro3qnDWctgDvWZFG4sKbVVagX/ZE10qMjqj8CGqwAopIxKY38+Y+XFKRaocS
	kJ0SOToiNgiuo3Fjp7WOAIXDOP+Jw7Pa+vxTSlPdA2yZJt+p2Gh5lQJRpncpSNpp7TUwvPyxMAR
	/JBPZBDkQYsbpru/+w==
X-Received: by 2002:a05:6214:3f91:b0:91e:771d:20be with SMTP id 6a1803df08f44-91ea984a3a6mr11628486d6.32.1793926319103;
        Thu, 05 Nov 2026 16:51:59 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acebb0sm7929016d6.45.2026.11.05.16.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 16:51:58 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] dmaengine: Free channel and device IDs correctly
Date: Thu,  5 Nov 2026 19:51:54 -0500
Message-ID: <20261106005154.1669214-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Commit 0821009445a8 ("dmaengine: fix channel index enumeration") added
device->chan_ida and moved freeing device->dev_id from chan_dev_release()
to dma_async_device_unregister(). Since then, two paths handle these IDs
incorrectly.

__dma_async_device_channel_unregister() frees chan->chan_id before
device_unregister() removes the channel's sysfs entry. A channel
registered on the same device in that window can get the same ID, and
its device_register() fails:

  sysfs: cannot create duplicate filename '/devices/platform/...
  kobject: kobject_add_internal failed for dma0chan0 with -EEXIST, ...

idxd can hit this when one wq is unbound while another wq of the same
device is bound, because it holds only the per-wq lock.

When dma_async_device_register() fails after registering at least one
channel, its err_out path unregisters the channel devices but frees
neither the channel IDs nor device->dev_id. The next DMA device then
gets the next "dma<N>" number, skipping the leaked one.

In __dma_async_device_channel_unregister(), free chan_id after
device_unregister(). In the err_out path, add the missing frees: each
chan_id after device_unregister(), and dev_id after the loop.

Fixes: 0821009445a8 ("dmaengine: fix channel index enumeration")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---

Notes:
    Found with a static analysis tool we are developing.
    
    Tested in QEMU (x86_64) with two test modules:
    
    - Unregister one channel and register another on the same dma_device
      from a second thread. A class_interface remove_dev() callback on the
      dma class starts the second thread while device_del() of the first
      channel is in progress, to make the window deterministic. Without
      this patch the new channel gets ID 0 and fails with -EEXIST. With it,
      the new channel gets ID 1 and is registered.
    
    - Register a dma_device whose second channel fails to register (both
      channels request the same static channel ID). Without this patch
      chan_ida is not empty afterwards and the next dma_device gets dev_id
      1. With it, chan_ida is empty and dev_id 0 is reused.
    
    Not tested on idxd hardware.

 drivers/dma/dmaengine.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 34be53487a21..6f9dcc735af5 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1171,8 +1171,8 @@ static void __dma_async_device_channel_unregister(struct dma_device *device,
 	device->chancnt--;
 	chan->chan_dev->chan = NULL;
 	mutex_unlock(&dma_list_mutex);
-	ida_free(&device->chan_ida, chan->chan_id);
 	device_unregister(dmaengine_chan_dev(chan));
+	ida_free(&device->chan_ida, chan->chan_id);
 	free_percpu(chan->local);
 }
 
@@ -1307,8 +1307,10 @@ int dma_async_device_register(struct dma_device *device)
 		chan->chan_dev->chan = NULL;
 		mutex_unlock(&dma_list_mutex);
 		device_unregister(dmaengine_chan_dev(chan));
+		ida_free(&device->chan_ida, chan->chan_id);
 		free_percpu(chan->local);
 	}
+	ida_free(&dma_ida, device->dev_id);
 	return rc;
 }
 EXPORT_SYMBOL(dma_async_device_register);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


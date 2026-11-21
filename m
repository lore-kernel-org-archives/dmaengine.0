Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795274749;
	b=oH76BGx0JaKwFft3WL9ZPItqXke2OMLDWeTCvHNmJUvEeoAsCmuArzy2d34DBwg/VVJh
	 WhSdj/U7PEvBHmiC2n+4x/mcnvyh2db2O7F+MazFD7sIa7QGyC6/0Vl5U3w6LVDcj0uTh
	 uuUisGrKD8A7y/D1Rw9GVGNZefrwiarZhPPrPM0SBqg2fsCp/s5u8OKjk0vvSVSH12R1H
	 leKAFTc1tW2592Ix3hoGaRa7Kv9E5UQmOxzXOQkiKhYIIyBwqyFZxXyOq8B938poys/Dw
	 HZpRF8BVVEjrNACxiOyegHF9vRjT1n23Qw80rEokmlSqIXM8ewFvm3HCt9MO9FxUT/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795274749;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=mvqL5zgYjOQw7mrezGKjOH5XqeKwhXIVXfDOZi54svQ=;
	b=JgaomET9fzNIF0Pyz8CUP0W7wxVn3F/nBJiiQuJBJLXRKjqLS3XeVLaNyhgUbjN8YZuG
	 9WPGzJ2OjpQPnL84vCJhZALIWabMpDp0nUUL8GaAV2I/1CQlW+sa0iYZhM1xoACbucCGx
	 Q9Bqr5Gnap76kk0fYErmk6UdOmz14DKFpbzbFVlQhvrJp3ZomGyMmjUGVWMfOCCh1oBtQ
	 CFw9ozO7x8zmm8ePvjqmqsVLA3hQFcVA9Om8Dsen42ds3qBITO7B0ezOrH+bdsBa7K1mE
	 PEPgZtBb+El4VbWHB2H09njRTF+VgU59lRtWGsqRzK9Wn8sR94e91UXfiTL3YJThGqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C625E606A320
	for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 15:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C625E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso2381129b6e.0
        for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 07:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795274748; x=1795879548;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mvqL5zgYjOQw7mrezGKjOH5XqeKwhXIVXfDOZi54svQ=;
        b=E2IWiwSCBgHV2y1APLjrRaurEiG4KbaJkCmgQhFGZTuBjqtVujo6bcrqieH1g+jJTN
         7RMmiSkDagupMAupzpxrZH97rEaK7SWhKsvDcLHqvtkmICI8ZvYISXKcmyxRhQpsYjUk
         5LfgFCPjIj9n2BXZ9fdYQASqqUBdbUUlkjDRaMIR3FUn3T0cx44KogkJjxCWa8wasxy7
         cXdC96kSonmUtiYlHwBIrfuR7iKWRNxnCbMsSD/cDL5tTBiIsqu0Vq7hbsonE++dCzIg
         5HP4n382tu9aZyk67rYEoUgID7AVp5cNvVYKEKMWbgRbW93JPk/T6wSHGvL0gsNg17aE
         wxUA==
X-Forwarded-Encrypted: i=1; AL+hErFKgw3k30O3AumUe9oESnH0QEvdWW5VAlfxfodVeZvdEsNRNhw0Lzi5K9Pgtn6NJQf/Dhz7SL+zONY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ny2Mja50ffKzM/HGDmPk+HSPtWN+unW6BviE2fWHtraVE/HUa
	n0iG8Mumi6i5sFvh2ZBrnszaO4AWyoxatFHx9GYndaN7HO3mK92prNLBJdXz4kq63REyeJOQpSN
	hyoS/JIn45VUuaRo7xCpskkiVPdfMeQJsABCvfCtSSfIDzBulVYEfoNuO4f8=
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1386:b0:574:6f37:6727 with SMTP id
 5614622812f47-57a06b1e099mr7204479b6e.3.1795274747833; Sat, 21 Nov 2026
 07:25:47 -0800 (PST)
Date: Sat, 21 Nov 2026 07:25:47 -0800
In-Reply-To: <6a891a2c.91706f20.16b6e3.02b1.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b01b7fb.44b41460.34b83f.000f.GAE@google.com>
Subject: Re: [syzbot] [dmaengine?] BUG: unable to handle kernel paging request
 in ioat_pci_probe
From: syzbot <syzbot+79a6b3f7a8df01f58774@syzkaller.appspotmail.com>
To: Frank.Li@kernel.org, dave.jiang@intel.com, dmaengine@vger.kernel.org, 
	frank.li@kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    909ef7a9a30f Add linux-next specific files for 20261120
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13ca7cd5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=15db63a14ba195ac
dashboard link: https://syzkaller.appspot.com/bug?extid=79a6b3f7a8df01f58774
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10a07185580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+79a6b3f7a8df01f58774@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: 000000000001c008
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 8000000074684067 P4D 8000000074684067 PUD 0 
Oops: Oops: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 6362 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
RIP: 0010:readb arch/x86/include/asm/io.h:57 [inline]
RIP: 0010:ioat_pci_probe+0xad/0x410 drivers/dma/ioat/init.c:1365
Code: 48 85 c0 74 4c 49 89 c7 48 b8 00 00 00 00 00 fc ff df 4c 89 fb 48 c1 eb 03 80 3c 03 00 74 08 4c 89 ff e8 06 55 c3 fc 49 8b 07 <44> 8a 60 08 41 0f b6 ec bf 30 00 00 00 89 ee e8 2f 13 43 fc 41 80
RSP: 0018:ffffc900034578f8 EFLAGS: 00010246
RAX: 000000000001c000 RBX: 1ffff110056d8ae7 RCX: ffff88801c9d5dc0
RDX: 0000000000000000 RSI: ffffffff8ea2b415 RDI: 00000000ffffffff
RBP: ffffc90003457b20 R08: ffffffff91e1e4bf R09: 1ffffffff23c3c97
R10: dffffc0000000000 R11: fffffbfff23c3c98 R12: 1ffff110045d3c10
R13: 0000000000000000 R14: ffff888022e9e000 R15: ffff88802b6c5738
FS:  00007f687f7dd6c0(0000) GS:ffff8881231fd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000001c008 CR3: 000000007f156000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 local_pci_probe drivers/pci/pci-driver.c:355 [inline]
 pci_call_probe drivers/pci/pci-driver.c:417 [inline]
 __pci_device_probe drivers/pci/pci-driver.c:479 [inline]
 pci_device_probe+0x48e/0xd10 drivers/pci/pci-driver.c:513
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:707
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:869
 device_driver_attach+0xe4/0x1f0 drivers/base/dd.c:1211
 bind_store+0x1d0/0x220 drivers/base/bus.c:267
 kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:580 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:672
 ksys_write+0x150/0x270 fs/read_write.c:1021
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007f688019e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f687f7dd028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f6880426090 RCX: 00007f688019e0d9
RDX: 000000000000000d RSI: 0000200000000600 RDI: 0000000000000005
RBP: 00007f6880235024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f6880426128 R14: 00007f6880426090 R15: 00007ffcb8a3f2d8
 </TASK>
Modules linked in:
CR2: 000000000001c008
---[ end trace 0000000000000000 ]---
RIP: 0010:readb arch/x86/include/asm/io.h:57 [inline]
RIP: 0010:ioat_pci_probe+0xad/0x410 drivers/dma/ioat/init.c:1365
Code: 48 85 c0 74 4c 49 89 c7 48 b8 00 00 00 00 00 fc ff df 4c 89 fb 48 c1 eb 03 80 3c 03 00 74 08 4c 89 ff e8 06 55 c3 fc 49 8b 07 <44> 8a 60 08 41 0f b6 ec bf 30 00 00 00 89 ee e8 2f 13 43 fc 41 80
RSP: 0018:ffffc900034578f8 EFLAGS: 00010246
RAX: 000000000001c000 RBX: 1ffff110056d8ae7 RCX: ffff88801c9d5dc0
RDX: 0000000000000000 RSI: ffffffff8ea2b415 RDI: 00000000ffffffff
RBP: ffffc90003457b20 R08: ffffffff91e1e4bf R09: 1ffffffff23c3c97
R10: dffffc0000000000 R11: fffffbfff23c3c98 R12: 1ffff110045d3c10
R13: 0000000000000000 R14: ffff888022e9e000 R15: ffff88802b6c5738
FS:  00007f687f7dd6c0(0000) GS:ffff8881231fd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000001c008 CR3: 000000007f156000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	48 85 c0             	test   %rax,%rax
   3:	74 4c                	je     0x51
   5:	49 89 c7             	mov    %rax,%r15
   8:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
   f:	fc ff df
  12:	4c 89 fb             	mov    %r15,%rbx
  15:	48 c1 eb 03          	shr    $0x3,%rbx
  19:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
  1d:	74 08                	je     0x27
  1f:	4c 89 ff             	mov    %r15,%rdi
  22:	e8 06 55 c3 fc       	call   0xfcc3552d
  27:	49 8b 07             	mov    (%r15),%rax
* 2a:	44 8a 60 08          	mov    0x8(%rax),%r12b <-- trapping instruction
  2e:	41 0f b6 ec          	movzbl %r12b,%ebp
  32:	bf 30 00 00 00       	mov    $0x30,%edi
  37:	89 ee                	mov    %ebp,%esi
  39:	e8 2f 13 43 fc       	call   0xfc43136d
  3e:	41                   	rex.B
  3f:	80                   	.byte 0x80
